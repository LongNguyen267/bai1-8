using API_dki_tai_khoan.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;

namespace API_dki_tai_khoan.Controllers
{
    [ApiController]
    [Route("api/accounts")]
    public class AccountsController : ControllerBase
    {
        private readonly ApplicationDbContext _dbContext;

        public AccountsController(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        [HttpPost("register")]
        public IActionResult Register([FromBody] RegisterAccountRequest request)
        {
            // Kiểm tra trùng số tài khoản
            var existingAccount = _dbContext.TaiKhoan.FirstOrDefault(a => a.SoTaiKhoan == request.AccountNumber);
            if (existingAccount != null)
            {
                return BadRequest(new { status = "FAIL", message = "Số tài khoản đã tồn tại." });
            }

            // Kiểm tra số dư ban đầu
            if (request.InitialBalance < 100000)
            {
                return BadRequest(new { status = "FAIL", message = "Số dư ban đầu phải ít nhất 100,000 đồng." });
            }

            // Kiểm tra ngày hết hạn CCCD
            if (request.ExpiryDate < DateTime.Today)
            {
                return BadRequest(new { status = "FAIL", message = "Căn cước công dân đã hết hạn." });
            }

            var newAccount = new TaiKhoan
            {
                SoTaiKhoan = request.AccountNumber,
                HoTenChuThe = request.AccountHolder,
                SoDienThoai = request.Phone,
                CanCuocCongDan = request.CitizenId,
                NgayHetHan = request.ExpiryDate,
                SoDuKhaDung = request.InitialBalance
            };

            _dbContext.TaiKhoan.Add(newAccount);
            _dbContext.SaveChanges();

            return Ok(new
            {
                status = "SUCCESS",
                accountId = newAccount.SoTaiKhoan,
                message = "Tạo tài khoản thành công"
            });
        }

        [HttpGet("{accountNumber}")]
        public IActionResult GetAccount(string accountNumber)
        {
            // Tìm tài khoản trong database
            var account = _dbContext.TaiKhoan.FirstOrDefault(a => a.SoTaiKhoan == accountNumber);

            if (account == null)
            {
                return NotFound(new { status = "FAIL", message = "Không tìm thấy tài khoản." });
            }

            // Trả về thông tin tài khoản
            return Ok(new
            {
                accountNumber = account.SoTaiKhoan,
                accountHolder = account.HoTenChuThe,
                phone = account.SoDienThoai,
                citizenId = account.CanCuocCongDan,
                expiryDate = account.NgayHetHan,
                availableBalance = account.SoDuKhaDung
            });
        }
    }
}