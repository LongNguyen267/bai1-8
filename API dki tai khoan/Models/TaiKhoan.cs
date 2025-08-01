using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace API_dki_tai_khoan.Models
{
    [Table("TaiKhoan")]
    public class TaiKhoan
    {
        [Key]
        public string SoTaiKhoan { get; set; }
        public string HoTenChuThe { get; set; }
        public string SoDienThoai { get; set; }
        public string CanCuocCongDan { get; set; }
        public DateTime NgayHetHan { get; set; }
        public decimal SoDuKhaDung { get; set; }
    }
}