using CRUD_WEB_API.Model.Data;
using CRUD_WEB_API.Repo;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();

// ------------- Enable CORS ------------------

builder.Services.AddCors(option =>
{
    option.AddDefaultPolicy(builder =>
    {
        builder.AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod();
    });
});


builder.Services.AddTransient<IUserRepo, UserRepo>(s =>
{
    var configuration = s.GetRequiredService<IConfiguration>();
    var connection = configuration.GetConnectionString("connection");
    return new UserRepo(connection);
});

builder.Services.AddTransient<ICustomerRepo, CustomerRepo>(s =>
{
    var configuration = s.GetRequiredService<IConfiguration>();
    var connection = configuration.GetConnectionString("connection");
    return new CustomerRepo(connection);
});
builder.Services.AddTransient<ILoginRepo, LoginRepo>(s =>
{
    var configuration = s.GetRequiredService<IConfiguration>();
    var connection = configuration.GetConnectionString("connection");
    return new LoginRepo(connection);
});
builder.Services.AddAuthentication(x =>
{
    x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;

}).AddJwtBearer(x =>
{
    x.RequireHttpsMetadata = false;
    x.SaveToken = true;
    x.TokenValidationParameters = new Microsoft.IdentityModel.Tokens.TokenValidationParameters
    {
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("veryveryverysecretsecretsecret.....")),
        ValidateAudience = false,
        ValidateIssuer = false
    };
});
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseCors();
app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
