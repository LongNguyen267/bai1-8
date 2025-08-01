using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace API_dki_tai_khoan.Models
{
    [Table("LaiSuatKyHan")]
    public class LaiSuatKyHan
    {
        [Key]
        public int KyHanThang { get; set; }
        public decimal LaiSuatNam { get; set; }
    }
}
