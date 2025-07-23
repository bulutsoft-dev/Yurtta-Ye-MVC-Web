using FluentAssertions;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using Microsoft.Extensions.Localization;
using Moq;
using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Xunit;
using YurttaYe.Core.Models.ViewModels;
using YurttaYe.Web.Controllers.Web;

namespace YurttaYe.Tests.UnitTests.Controllers.Web
{
    public class AccountControllerTests
    {
        private readonly Mock<UserManager<IdentityUser>> _mockUserManager;
        private readonly Mock<SignInManager<IdentityUser>> _mockSignInManager;
        private readonly Mock<IStringLocalizer<AccountController>> _mockLocalizer;
        private readonly AccountController _controller;

        public AccountControllerTests()
        {
            var userStore = new Mock<IUserStore<IdentityUser>>();
            _mockUserManager = new Mock<UserManager<IdentityUser>>(userStore.Object, null, null, null, null, null, null, null, null);
            
            var contextAccessor = new Mock<Microsoft.AspNetCore.Http.IHttpContextAccessor>();
            var userPrincipalFactory = new Mock<IUserClaimsPrincipalFactory<IdentityUser>>();
            _mockSignInManager = new Mock<SignInManager<IdentityUser>>(_mockUserManager.Object, contextAccessor.Object, userPrincipalFactory.Object, null, null, null, null);
            
            _mockLocalizer = new Mock<IStringLocalizer<AccountController>>();
            
            // Setup default localizer responses
            var loginSuccessful = new LocalizedString("LoginSuccessful", "Giriş başarılı");
            var invalidLoginAttempt = new LocalizedString("InvalidLoginAttempt", "Geçersiz kullanıcı adı veya şifre");
            var systemError = new LocalizedString("SystemError", "Sistem hatası oluştu");
            
            _mockLocalizer.Setup(l => l["LoginSuccessful"]).Returns(loginSuccessful);
            _mockLocalizer.Setup(l => l["InvalidLoginAttempt"]).Returns(invalidLoginAttempt);
            _mockLocalizer.Setup(l => l["SystemError"]).Returns(systemError);

            _controller = new AccountController(_mockUserManager.Object, _mockSignInManager.Object, _mockLocalizer.Object);
            
            // Setup TempData mock
            var tempData = new TempDataDictionary(new DefaultHttpContext(), Mock.Of<ITempDataProvider>());
            _controller.TempData = tempData;
        }

        [Fact]
        public void Login_GET_Should_Return_View_With_ReturnUrl()
        {
            // Arrange
            var returnUrl = "/admin/dashboard";

            // Act
            var result = _controller.Login(returnUrl);

            // Assert
            result.Should().BeOfType<ViewResult>();
            var viewResult = result as ViewResult;
            _controller.ViewData["ReturnUrl"].Should().Be(returnUrl);
        }

        [Fact]
        public void Login_GET_Should_Use_Default_ReturnUrl_When_Null()
        {
            // Act
            var result = _controller.Login(null);

            // Assert
            result.Should().BeOfType<ViewResult>();
            _controller.ViewData["ReturnUrl"].Should().Be("/");
        }

        [Fact]
        public async Task Login_POST_Should_Return_View_When_ModelState_Invalid()
        {
            // Arrange
            var model = new LoginViewModel { Username = "", Password = "" };
            _controller.ModelState.AddModelError("Username", "Required");

            // Act
            var result = await _controller.Login(model, "/admin");

            // Assert
            result.Should().BeOfType<ViewResult>();
            var viewResult = result as ViewResult;
            viewResult!.Model.Should().Be(model);
            _controller.ViewData["ReturnUrl"].Should().Be("/admin");
        }

        [Fact]
        public async Task Login_POST_Should_Redirect_To_Admin_When_Successful_Login()
        {
            // Arrange
            var model = new LoginViewModel { Username = "testuser", Password = "testpass" };
            var user = new IdentityUser { UserName = "testuser" };

            _mockUserManager.Setup(um => um.FindByNameAsync("testuser"))
                .ReturnsAsync(user);
            
            _mockUserManager.Setup(um => um.CheckPasswordAsync(user, "testpass"))
                .ReturnsAsync(true);

            _mockSignInManager.Setup(sm => sm.SignInAsync(user, false, null))
                .Returns(Task.CompletedTask);

            // Act
            var result = await _controller.Login(model, null);

            // Assert
            result.Should().BeOfType<RedirectToActionResult>();
            var redirectResult = result as RedirectToActionResult;
            redirectResult!.ActionName.Should().Be("Index");
            redirectResult.ControllerName.Should().Be("Home");
            redirectResult.RouteValues!["area"].Should().Be("Admin");
        }

        [Fact]
        public async Task Login_POST_Should_Redirect_To_ReturnUrl_When_Valid_Local_Url()
        {
            // Arrange
            var model = new LoginViewModel { Username = "testuser", Password = "testpass" };
            var user = new IdentityUser { UserName = "testuser" };
            var returnUrl = "/admin/dashboard";

            _mockUserManager.Setup(um => um.FindByNameAsync("testuser"))
                .ReturnsAsync(user);
            
            _mockUserManager.Setup(um => um.CheckPasswordAsync(user, "testpass"))
                .ReturnsAsync(true);

            _mockSignInManager.Setup(sm => sm.SignInAsync(user, false, null))
                .Returns(Task.CompletedTask);

            // Mock URL helper to return true for local URL
            var mockUrlHelper = new Mock<IUrlHelper>();
            mockUrlHelper.Setup(u => u.IsLocalUrl(returnUrl)).Returns(true);
            _controller.Url = mockUrlHelper.Object;

            // Act
            var result = await _controller.Login(model, returnUrl);

            // Assert
            result.Should().BeOfType<RedirectResult>();
            var redirectResult = result as RedirectResult;
            redirectResult!.Url.Should().Be(returnUrl);
        }

        [Fact]
        public async Task Login_POST_Should_Add_ModelError_When_Invalid_Credentials()
        {
            // Arrange
            var model = new LoginViewModel { Username = "testuser", Password = "wrongpass" };
            var user = new IdentityUser { UserName = "testuser" };

            _mockUserManager.Setup(um => um.FindByNameAsync("testuser"))
                .ReturnsAsync(user);
            
            _mockUserManager.Setup(um => um.CheckPasswordAsync(user, "wrongpass"))
                .ReturnsAsync(false);

            // Act
            var result = await _controller.Login(model, null);

            // Assert
            result.Should().BeOfType<ViewResult>();
            _controller.ModelState.Should().ContainKey("");
            _controller.TempData["ErrorMessage"].Should().Be("Geçersiz kullanıcı adı veya şifre");
        }

        [Fact]
        public async Task Login_POST_Should_Add_ModelError_When_User_Not_Found()
        {
            // Arrange
            var model = new LoginViewModel { Username = "nonexistentuser", Password = "testpass" };

            _mockUserManager.Setup(um => um.FindByNameAsync("nonexistentuser"))
                .ReturnsAsync((IdentityUser)null!);

            // Act
            var result = await _controller.Login(model, null);

            // Assert
            result.Should().BeOfType<ViewResult>();
            _controller.ModelState.Should().ContainKey("");
            _controller.TempData["ErrorMessage"].Should().Be("Geçersiz kullanıcı adı veya şifre");
        }

        [Fact]
        public async Task Login_POST_Should_Handle_Exception_Gracefully()
        {
            // Arrange
            var model = new LoginViewModel { Username = "testuser", Password = "testpass" };

            _mockUserManager.Setup(um => um.FindByNameAsync("testuser"))
                .ThrowsAsync(new Exception("Database error"));

            // Act
            var result = await _controller.Login(model, null);

            // Assert
            result.Should().BeOfType<ViewResult>();
            _controller.ModelState.Should().ContainKey("");
            _controller.TempData["ErrorMessage"].Should().Be("Sistem hatası oluştu");
        }

        [Fact]
        public async Task Logout_Should_SignOut_And_Redirect_To_Home()
        {
            // Arrange
            _mockSignInManager.Setup(sm => sm.SignOutAsync())
                .Returns(Task.CompletedTask);

            // Act
            var result = await _controller.Logout();

            // Assert
            result.Should().BeOfType<RedirectToActionResult>();
            var redirectResult = result as RedirectToActionResult;
            redirectResult!.ActionName.Should().Be("Index");
            redirectResult.ControllerName.Should().Be("Home");
            
            _mockSignInManager.Verify(sm => sm.SignOutAsync(), Times.Once);
        }

        [Fact]
        public void AccessDenied_Should_Return_View()
        {
            // Act
            var result = _controller.AccessDenied();

            // Assert
            result.Should().BeOfType<ViewResult>();
        }

        [Fact]
        public void Controller_Should_Have_Authorize_Attribute()
        {
            // Assert
            var controllerType = typeof(AccountController);
            controllerType.Should().BeDecoratedWith<AuthorizeAttribute>();
        }

        [Fact]
        public void Login_GET_Should_Have_AllowAnonymous_Attribute()
        {
            // Assert
            var method = typeof(AccountController).GetMethod(nameof(AccountController.Login), new[] { typeof(string) });
            method.Should().BeDecoratedWith<AllowAnonymousAttribute>();
        }

        [Fact]
        public void Login_POST_Should_Have_AllowAnonymous_And_ValidateAntiForgeryToken_Attributes()
        {
            // Assert
            var method = typeof(AccountController).GetMethod(nameof(AccountController.Login), new[] { typeof(LoginViewModel), typeof(string) });
            method.Should().BeDecoratedWith<AllowAnonymousAttribute>();
            method.Should().BeDecoratedWith<ValidateAntiForgeryTokenAttribute>();
        }

        [Fact]
        public void Constructor_Should_Throw_ArgumentNullException_When_UserManager_Is_Null()
        {
            // Act & Assert
            var action = () => new AccountController(null!, _mockSignInManager.Object, _mockLocalizer.Object);
            action.Should().Throw<ArgumentNullException>();
        }

        [Fact]
        public void Constructor_Should_Throw_ArgumentNullException_When_SignInManager_Is_Null()
        {
            // Act & Assert
            var action = () => new AccountController(_mockUserManager.Object, null!, _mockLocalizer.Object);
            action.Should().Throw<ArgumentNullException>();
        }

        [Fact]
        public void Constructor_Should_Throw_ArgumentNullException_When_Localizer_Is_Null()
        {
            // Act & Assert
            var action = () => new AccountController(_mockUserManager.Object, _mockSignInManager.Object, null!);
            action.Should().Throw<ArgumentNullException>();
        }
    }
}
