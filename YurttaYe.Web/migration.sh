cd YurttaYe.Data
dotnet ef migrations add Initial --startup-project ../YurttaYe.Web
dotnet ef database update --startup-project ../YurttaYe.Web