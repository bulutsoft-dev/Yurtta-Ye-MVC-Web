FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER $APP_UID
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["YurttaYe.Web/YurttaYe.Web.csproj", "YurttaYe.Web/"]
COPY ["YurttaYe.Core/YurttaYe.Core.csproj", "YurttaYe.Core/"]
COPY ["YurttaYe.Data/YurttaYe.Data.csproj", "YurttaYe.Data/"]
COPY ["YurttaYe.Services/YurttaYe.Services.csproj", "YurttaYe.Services/"]
RUN dotnet restore "YurttaYe.Web/YurttaYe.Web.csproj"
COPY . .
WORKDIR "/src/YurttaYe.Web"
RUN dotnet build "./YurttaYe.Web.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./YurttaYe.Web.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "YurttaYe.Web.dll"]
