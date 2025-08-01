using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace API_dki_tai_khoan.Models
{
    [Table("SoTietKiem")]
    public class SoTietKiem
    {
        [Key]
        public string MaSoTietKiem { get; set; }
        public string SoTaiKhoan { get; set; }
        public decimal SoTien { get; set; }
        public int KyHanThang { get; set; }
        public decimal LaiSuatNam { get; set; }
        public DateTime NgayBatDau { get; set; }
        public DateTime NgayDaoHan { get; set; }
        public bool TuDongGiaHan { get; set; }
    }
}