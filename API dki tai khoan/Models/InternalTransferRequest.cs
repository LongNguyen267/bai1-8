using System.ComponentModel.DataAnnotations;
namespace API_dki_tai_khoan.Models
{
    public class InternalTransferRequest
    {
        [Required]
        public string FromAccount { get; set; }
        [Required]
        public string ToAccountOrPhone { get; set; }
        public decimal Amount { get; set; }
        public string Note { get; set; }
    }
}
