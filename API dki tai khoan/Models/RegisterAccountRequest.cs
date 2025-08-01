namespace API_dki_tai_khoan.Models
{
    public class RegisterAccountRequest
    {
        public string AccountNumber { get; set; } = string.Empty;
        public string AccountHolder { get; set; } = string.Empty;
        public string Phone { get; set; } = string.Empty;
        public string CitizenId { get; set; } = string.Empty;
        public DateTime ExpiryDate { get; set; }
        public decimal InitialBalance { get; set; }
    }
}
