using API_dki_tai_khoan.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;

namespace API_dki_tai_khoan.Controllers
{
    [ApiController]
    [Route("api")]
    public class TransfersController : ControllerBase
    {
        private readonly ApplicationDbContext _dbContext;

        public TransfersController(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        [HttpPost("transfers/internal")]
        public IActionResult InternalTransfer([FromBody] InternalTransferRequest request)
        {
            // 1. Tìm tài khoản gửi và nhận
            var fromAccount = _dbContext.TaiKhoan.FirstOrDefault(a => a.SoTaiKhoan == request.FromAccount);
            if (fromAccount == null)
            {
                return BadRequest(new { status = "FAIL", message = "Tài khoản gửi không tồn tại." });
            }

            var toAccount = _dbContext.TaiKhoan.FirstOrDefault(a => a.SoTaiKhoan == request.ToAccountOrPhone || a.SoDienThoai == request.ToAccountOrPhone);
            if (toAccount == null)
            {
                return BadRequest(new { status = "FAIL", message = "Tài khoản nhận không tồn tại." });
            }

            // 2. Kiểm tra số dư khả dụng và số tiền
            // Cần đảm bảo tài khoản gửi còn lại ít nhất 50,000 đ
            if (fromAccount.SoDuKhaDung - request.Amount < 50000 || request.Amount <= 0)
            {
                return BadRequest(new { status = "FAIL", message = "Số dư không đủ hoặc số tiền không hợp lệ. Số dư khả dụng phải còn ít nhất 50,000 đ." });
            }

            // 3. Thực hiện chuyển tiền và lưu giao dịch
            var transactionId = $"TXN{DateTime.Now.ToString("yyyyMMddHHmmss")}";
            var transactionTime = DateTime.Now;

            using (var transaction = _dbContext.Database.BeginTransaction())
            {
                try
                {
                    // Trừ tiền tài khoản gửi
                    fromAccount.SoDuKhaDung -= request.Amount;
                    _dbContext.GiaoDich.Add(new GiaoDich
                    {
                        MaGiaoDich = transactionId,
                        SoTaiKhoan = fromAccount.SoTaiKhoan,
                        SoTien = -request.Amount,
                        ThoiGianGiaoDich = transactionTime,
                        SoDuSauGiaoDich = fromAccount.SoDuKhaDung,
                        NoiDung = $"Chuyển khoản nội bộ đến {toAccount.SoTaiKhoan}: {request.Note}"
                    });

                    // Cộng tiền tài khoản nhận
                    toAccount.SoDuKhaDung += request.Amount;
                    _dbContext.GiaoDich.Add(new GiaoDich
                    {
                        MaGiaoDich = Guid.NewGuid().ToString(), // Dùng Guid cho giao dịch nhận để đảm bảo duy nhất
                        SoTaiKhoan = toAccount.SoTaiKhoan,
                        SoTien = request.Amount,
                        ThoiGianGiaoDich = transactionTime,
                        SoDuSauGiaoDich = toAccount.SoDuKhaDung,
                        NoiDung = $"Nhận chuyển khoản nội bộ từ {fromAccount.SoTaiKhoan}: {request.Note}"
                    });

                    _dbContext.SaveChanges();
                    transaction.Commit();
                }
                catch (Exception)
                {
                    transaction.Rollback();
                    return StatusCode(500, new { status = "FAIL", message = "Có lỗi xảy ra trong quá trình xử lý giao dịch." });
                }
            }

            // 4. Trả về phản hồi thành công
            return Ok(new
            {
                status = "SUCCESS",
                transactionId = transactionId,
                timestamp = transactionTime.ToString("yyyy-MM-ddTHH:mm:ss"),
                remainingBalance = fromAccount.SoDuKhaDung
            });
        }

        [HttpPost("transfers/external")]
        public IActionResult ExternalTransfer([FromBody] ExternalTransferRequest request)
        {
            var fromAccount = _dbContext.TaiKhoan.FirstOrDefault(a => a.SoTaiKhoan == request.FromAccount);
            if (fromAccount == null)
            {
                return BadRequest(new { status = "FAIL", message = "Tài khoản gửi không tồn tại." });
            }

            // Kiểm tra số dư khả dụng và số tiền
            if (fromAccount.SoDuKhaDung - request.Amount < 50000 || request.Amount <= 0)
            {
                return BadRequest(new { status = "FAIL", message = "Số dư không đủ hoặc số tiền không hợp lệ. Số dư khả dụng phải còn ít nhất 50,000 đ." });
            }

            var transactionId = $"TXN{DateTime.Now.ToString("yyyyMMddHHmmss")}";
            var transactionTime = DateTime.Now;

            using (var transaction = _dbContext.Database.BeginTransaction())
            {
                try
                {
                    // Trừ tiền tài khoản gửi
                    fromAccount.SoDuKhaDung -= request.Amount;
                    _dbContext.GiaoDich.Add(new GiaoDich
                    {
                        MaGiaoDich = transactionId,
                        SoTaiKhoan = fromAccount.SoTaiKhoan,
                        SoTien = -request.Amount,
                        ThoiGianGiaoDich = transactionTime,
                        SoDuSauGiaoDich = fromAccount.SoDuKhaDung,
                        NoiDung = $"Chuyển khoản liên ngân hàng đến {request.ToBankCode} - {request.ToAccount}: {request.Note}"
                    });

                    _dbContext.SaveChanges();
                    transaction.Commit();
                }
                catch (Exception)
                {
                    transaction.Rollback();
                    return StatusCode(500, new { status = "FAIL", message = "Có lỗi xảy ra trong quá trình xử lý giao dịch." });
                }
            }

            return Ok(new
            {
                status = "SUCCESS",
                transactionId = transactionId,
                timestamp = transactionTime.ToString("yyyy-MM-ddTHH:mm:ss"),
                remainingBalance = fromAccount.SoDuKhaDung
            });
        }

        [HttpGet("transactions")]
        public IActionResult GetTransactions(string accountNumber, DateTime fromDate, DateTime toDate)
        {
            var transactions = _dbContext.GiaoDich
                .Where(t => t.SoTaiKhoan == accountNumber && t.ThoiGianGiaoDich >= fromDate && t.ThoiGianGiaoDich <= toDate)
                .ToList();

            if (!transactions.Any())
            {
                return NotFound(new { message = "Không tìm thấy giao dịch nào trong khoảng thời gian này." });
            }

            var accountHolder = _dbContext.TaiKhoan.FirstOrDefault(a => a.SoTaiKhoan == accountNumber)?.HoTenChuThe;

            var response = transactions.Select(t => new
            {
                transactionId = t.MaGiaoDich,
                accountHolder = accountHolder,
                accountNumber = t.SoTaiKhoan,
                amount = t.SoTien,
                transactionTime = t.ThoiGianGiaoDich,
                balanceAfter = t.SoDuSauGiaoDich,
                note = t.NoiDung
            }).ToList();

            return Ok(response);
        }
    }
}