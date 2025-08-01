using System.ComponentModel.DataAnnotations;
namespace API_dki_tai_khoan.Models
{
    public class ExternalTransferRequest
    {
        [Required]
        public string FromAccount { get; set; }
        [Required]
        public string ToBankCode { get; set; }
        [Required]
        public string ToAccount { get; set; }
        public decimal Amount { get; set; }
        public string Note { get; set; }
    }
}
