namespace ecommerceDemo.Models
{
    public class AuthenticateResponse
    {
        public int AccountId { get; set; }
        public string? FullName { get; set; }
        public string? Email { get; set; }
        public string? Region { get; set; }
    }
}
