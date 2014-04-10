// JScript source code
	$(document).ready(function() {
		// global variables
		var form = $("#createUser");
		var userName = $("#userName"); // textbox u are going to validate
		var userNameMessage = $("#userNameMessage"); // to display error message
		// first validation on form submit
		form.submit(function() {
			// validation begin before submit
			if (validateName()) {
				return true;
			} else {
				return false;
			}
		});
		// declare name validation function
		function validateName() {
			// validation for empty
			if (userName.val() == "") {
				userName.addClass("error");
				userNameMessage.text("Tên đăng nhập không được để trống!");
				userNameMessage.addClass("error");
				return false;
			} else {
				userName.removeClass("error");
				userNameMessage.text("*");
				userNameMessage.removeClass("error");
			}
			// check length input
			if (userName.val().length < 4 || userName.val().length > 32) {
				userName.addClass("error");
				userNameMessage.text("Tên đăng nhập phải có độ dài từ 4 đến 32 ký tự!");
				userNameMessage.addClass("error");
				return false;
			}
			// if it's valid
			else {
				userName.removeClass("error");
				userNameMessage.text("*");
				userNameMessage.removeClass("error");
			}
			// validation only for characters no numbers
			var filter = /^[a-zA-Z]*$/;
			if (filter.test(userName.val())) {
				userName.removeClass("error");
				userNameMessage.text("*");
				userNameMessage.removeClass("error");
				return true;
			} else {
				userName.addClass("error");
				userNameMessage.text("Names cannot have numbers!");
				userNameMessage.addClass("error");
				return false;
			}
		}
	});