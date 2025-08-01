using API_dki_tai_khoan.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;
namespace API_dki_tai_khoan.Controllers
{
    [ApiController]
    [Route("api/savings")]
    public class SavingsController : ControllerBase
    {
        private readonly ApplicationDbContext _dbContext;

        public SavingsController(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        [HttpPost("open")]
        public IActionResult OpenSaving([FromBody] OpenSavingRequest request)
        {
            // 1. Tìm tài khoản và kiểm tra tồn tại
            var account = _dbContext.TaiKhoan.FirstOrDefault(a => a.SoTaiKhoan == request.AccountNumber);
            if (account == null)
            {
                return BadRequest(new { status = "FAIL", message = "Tài khoản không tồn tại." });
            }

            // 2. Kiểm tra số dư khả dụng
            if (account.SoDuKhaDung - request.Amount < 50000)
            {
                return BadRequest(new { status = "FAIL", message = "Không đủ số dư để mở tiết kiệm. Số dư sau khi mở phải >= 50,000 đ." });
            }

            // 3. Kiểm tra kỳ hạn có hợp lệ không
            var interestRateRecord = _dbContext.LaiSuatKyHan.FirstOrDefault(r => r.KyHanThang == request.TermMonths);
            if (interestRateRecord == null)
            {
                return BadRequest(new { status = "FAIL", message = "Kỳ hạn không hợp lệ." });
            }

            // 4. Cập nhật số dư và tạo sổ tiết kiệm mới
            account.SoDuKhaDung -= request.Amount; // Trừ số tiền gửi tiết kiệm khỏi số dư khả dụng
            var savingId = Guid.NewGuid().ToString().Substring(0, 8).ToUpper(); // Tạo mã tiết kiệm ngẫu nhiên
            var startDate = DateTime.Today;
            var maturityDate = startDate.AddMonths(request.TermMonths);

            var newSaving = new SoTietKiem
            {
                MaSoTietKiem = savingId,
                SoTaiKhoan = request.AccountNumber,
                SoTien = request.Amount,
                KyHanThang = request.TermMonths,
                LaiSuatNam = interestRateRecord.LaiSuatNam,
                NgayBatDau = startDate,
                NgayDaoHan = maturityDate,
                TuDongGiaHan = request.AutoRenew
            };

            _dbContext.SoTietKiem.Add(newSaving);
            _dbContext.SaveChanges();

            // 5. Trả về phản hồi thành công
            return Ok(new
            {
                status = "SUCCESS",
                savingId = savingId,
                termMonths = newSaving.KyHanThang,
                interestRate = newSaving.LaiSuatNam,
                startDate = newSaving.NgayBatDau.ToString("yyyy-MM-dd"),
                maturityDate = newSaving.NgayDaoHan.ToString("yyyy-MM-dd")
            });
        }

        [HttpGet("rates")]
        public IActionResult GetSavingsRates()
        {
            // Lấy tất cả thông tin lãi suất từ bảng LaiSuatKyHan
            var rates = _dbContext.LaiSuatKyHan.Select(r => new
            {
                termMonths = r.KyHanThang,
                interestRate = r.LaiSuatNam
            }).ToList();

            return Ok(rates);
        }
    }
}
