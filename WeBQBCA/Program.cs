using Microsoft.EntityFrameworkCore;
using WeBQBCA.Data;
using WeBQBCA.Repository;
using WeBQBCA.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container
//builder.Services.AddSession();

// Đăng ký IHttpContextAccessor
builder.Services.AddHttpContextAccessor();
builder.Services.AddControllersWithViews();
/*cấu hình xác thực cookie
builder.Services.AddAuthentication("CookieAuth")
    .AddCookie("CookieAuth", options =>
    {
        options.LoginPath = "/Account/Login";
        options.AccessDeniedPath = "/Account/AccessDenied";
    });
*/
builder.Services.AddScoped<IAuthService, AuthService>();
builder.Services.AddScoped<IUserRepository, UserRepository>();
//Them cau hoi
builder.Services.AddScoped<IQuestionRepository, QuestionRepository>();
builder.Services.AddScoped<IQuestionService, QuestionService>();
//Thêm mo hoc
builder.Services.AddScoped<ISubjectRepository, SubjectRepository>();

builder.Services.AddDistributedMemoryCache(); 
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30); // thời gian tồn tại session
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true;
});

// Cấu hình DbContext
builder.Services.AddDbContext<QbcaDbContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("QBCA_db"));
});
/*
builder.Services.AddIdentity<IdentityUser, IdentityRole>(options =>
{
    options.SignIn.RequireConfirmedAccount = true;
});

.AddEntityFrameworkStores<QbcaDbContext>()

.AddDefaultTokenProviders();
*/
var app = builder.Build();


// Configure the HTTP request pipeline
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Auth/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseSession();

//app.UseAuthentication();

app.UseAuthorization();

//app.MapStaticAssets();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Auth}/{action=Index}/{id?}")
    .WithStaticAssets();

app.Run();

