using API_dki_tai_khoan.Models;
using Microsoft.EntityFrameworkCore; // Thêm dòng này

var builder = WebApplication.CreateBuilder(args);

// === Bổ sung: Cấu hình DbContext ===
// Lấy chuỗi kết nối từ appsettings.json
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");

// Thêm dịch vụ DbContext vào bộ chứa Dependency Injection
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(connectionString));
// ====================================

// Add services to the container.
// Thay đổi từ AddControllersWithViews() sang AddControllers() cho API
builder.Services.AddControllers(); // Chỉ cần AddControllers() cho API, không cần Views

// === Bổ sung: Cấu hình Swagger/OpenAPI (rất hữu ích cho API) ===
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
// ===============================================================

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment()) // Trong môi trường Development, chúng ta muốn sử dụng Swagger và trang lỗi chi tiết
{
    // === Bổ sung: Sử dụng Swagger UI trong môi trường Development ===
    app.UseSwagger();
    app.UseSwaggerUI();
    // ===============================================================

    app.UseDeveloperExceptionPage(); // Hiển thị trang lỗi chi tiết trong Development
}
else
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

// === Thay đổi: Loại bỏ MapControllerRoute và thêm MapControllers cho API ===
// app.MapControllerRoute(
//     name: "default",
//     pattern: "{controller=Home}/{action=Index}/{id?}");

app.MapControllers(); // Ánh xạ các Controller API
// =======================================================================

app.Run();