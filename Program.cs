using WeBQBCA.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using WeBQBCA.Data;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container
builder.Services.AddControllersWithViews();
builder.Services.AddSession();

// Cấu hình DbContext
builder.Services.AddDbContext<QbcaDbContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("QBCA_db"));
});

// Cấu hình ASP.NET Core Identity
/*
builder.Services.AddDefaultIdentity<IdentityUser>(options =>
{
    options.SignIn.RequireConfirmedAccount = false;
})
 
.AddRoles<IdentityRole>() // nếu dùng role phân quyền
.AddEntityFrameworkStores<QbcaDbContext>();
*/
var app = builder.Build();

// Configure the HTTP request pipeline
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseSession();

app.UseAuthorization();

app.MapStaticAssets();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}")
    .WithStaticAssets();

app.Run();

