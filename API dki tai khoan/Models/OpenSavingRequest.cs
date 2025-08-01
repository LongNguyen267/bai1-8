using System;
using System.ComponentModel.DataAnnotations;
namespace API_dki_tai_khoan.Models
{
    public class OpenSavingRequest
    {
        [Required]
        public string AccountNumber { get; set; }
        public decimal Amount { get; set; }
        public int TermMonths { get; set; }
        public bool AutoRenew { get; set; }
    }
}
