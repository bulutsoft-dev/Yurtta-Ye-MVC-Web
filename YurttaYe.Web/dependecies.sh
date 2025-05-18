cd ..
dotnet add YurttaYe.Web/YurttaYe.Web.csproj package Microsoft.AspNetCore.Authentication.JwtBearer --version 8.0.8
dotnet add YurttaYe.Web/YurttaYe.Web.csproj package Microsoft.EntityFrameworkCore.Design --version 8.0.8
dotnet add YurttaYe.Web/YurttaYe.Web.csproj package Swashbuckle.AspNetCore --version 6.7.3
dotnet add YurttaYe.Web/YurttaYe.Web.csproj package Microsoft.EntityFrameworkCore.Sqlite


dotnet add YurttaYe.Data/YurttaYe.Data.csproj package Microsoft.EntityFrameworkCore --version 8.0.8
dotnet add YurttaYe.Data/YurttaYe.Data.csproj package Microsoft.EntityFrameworkCore.SqlServer --version 8.0.8
dotnet add YurttaYe.Data/YurttaYe.Data.csproj package Microsoft.AspNetCore.Identity.EntityFrameworkCore --version 8.0.8

cd YurttaYe.Data/
dotnet add package Microsoft.AspNetCore.App --framework net8.0

cd ..
