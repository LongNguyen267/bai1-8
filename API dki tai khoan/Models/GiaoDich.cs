using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace API_dki_tai_khoan.Models
{
    [Table("GiaoDich")]
    public class GiaoDich
    {
        [Key]
        public string MaGiaoDich { get; set; }
        [Required]
        public string SoTaiKhoan { get; set; }
        public decimal SoTien { get; set; }
        public DateTime ThoiGianGiaoDich { get; set; }
        public decimal SoDuSauGiaoDich { get; set; }
        public string NoiDung { get; set; }
    }
}
