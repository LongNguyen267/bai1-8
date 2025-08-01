using Microsoft.EntityFrameworkCore;
namespace API_dki_tai_khoan.Models
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
        }

        public DbSet<TaiKhoan> TaiKhoan { get; set; }
        
        public DbSet<SoTietKiem> SoTietKiem { get; set; }
        public DbSet<LaiSuatKyHan> LaiSuatKyHan { get; set; }
    }
}
