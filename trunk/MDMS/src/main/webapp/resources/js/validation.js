function formValidation() {
	var userName = document.createUser.userName;
	var fullName = document.createUser.fullName;
	var dateOfBirth = document.createUser.dateOfBirth;
	var phone = document.createUser.phone;
	var email = document.createUser.email;
	var province = document.createUser.province;
	var address = document.createUser.address;
	var roleID = document.createUser.roleID;

	if (!userName_validation(userName, 4, 32)) {
		$('#userNameMessage').text("Tên đăng nhập không thể bỏ trống và phải có độ dài từ 4 đến 32");
		userName.focus();
		return false;
	} else if (!valid_userName(userName)) {
		$('#userNameMessage').text('Tên đăng nhập chỉ chấp nhận các ký tự chữ thường [a-z], chữ hoa [A-Z], và các số [0-9]');
		userName.focus();
		return false;
	} else if (!valid_fullName(fullName)) {
		$('#userNameMessage').text("(*)");
		$('#fullNameMessage').text("Họ và tên chỉ chấp nhận các ký tự chữ thường [a-z], chữ hoa [A-Z]");
		fullName.focus();
		return false;
	} else if (!valid_dateOfBirth(dateOfBirth)) {
		$('#userNameMessage').text("(*)");
		$('#fullNameMessage').text("(*)");
		$('#dateOfBirthMessage').text("Ngày sinh không thể bỏ trống");
		dateOfBirth.focus();
		return false;
	} else if (!valid_phone(phone)) {
		$('#userNameMessage').text("(*)");
		$('#fullNameMessage').text("(*)");
		$('#dateOfBirthMessage').text("(*)");
		$('#phoneMessage').text("Số điện thoại chỉ chấp nhận các số từ 0-9 và có 10 ký tự");
		phone.focus();
		return false;
	} else if (!valid_Email(email)) {
		$('#userNameMessage').text("(*)");
		$('#fullNameMessage').text("(*)");
		$('#dateOfBirthMessage').text("(*)");
		$('#phoneMessage').text("(*)");
		$('#emailMessage').text(
				"Định dạng email phải theo quy chuẩn abc@cdf.xyz");
		email.focus();
		return false;
	} else if (!valid_province(province)) {
		$('#userNameMessage').text("(*)");
		$('#fullNameMessage').text("(*)");
		$('#dateOfBirthMessage').text("(*)");
		$('#phoneMessage').text("(*)");
		$('#emailMessage').text("(*)");
		$('#provinceMessage').text("Thành phố không thể bỏ trống");
		province.focus();
		return false;
	} else if (!valid_address(address)) {
		$('#userNameMessage').text("(*)");
		$('#fullNameMessage').text("(*)");
		$('#dateOfBirthMessage').text("(*)");
		$('#phoneMessage').text("(*)");
		$('#emailMessage').text("(*)");
		$('#provinceMessage').text("(*)");
		$('#districtMessage').text("(*)");
		$('#addressMessage').text("Số nhà không thể bỏ trống");
		address.focus();
		return false;
	} else if (!valid_roleID(roleID)) {
		$('#userNameMessage').text("(*)");
		$('#fullNameMessage').text("(*)");
		$('#dateOfBirthMessage').text("(*)");
		$('#phoneMessage').text("(*)");
		$('#emailMessage').text("(*)");
		$('#provinceMessage').text("(*)");
		$('#districtMessage').text("(*)");
		$('#addressMessage').text("(*)");
		$('#roleIDMessage').text("Chức vụ không thể bỏ trống");
		roleID.focus();
		return false;
	}
	
	return true;

}
function userName_validation(userName, mx, my) {
	var userName_len = userName.value.length;
	if (userName_len == 0 || userName_len >= my || userName_len < mx) {
		return false;
	}
	return true;
}
function valid_userName(userName) {
	var letters = /^[A-Za-z0-9]+$/;
	if (!userName.value.match(letters)) {
		return false;
	}
	return true;
}

function valid_fullName(fullName) {
	var letters = /^[0-9~@#\^\$&\*\(\)-_\+=\[\]\{\}\|\\,\.\?\s]*$/;
	if (fullName.value.match(letters)) {
		return false;
	}
	return true;
}
function valid_dateOfBirth(dateOfBirth) {
	if (dateOfBirth.value == "") {
		return false;
	}
	return true;
}
function valid_phone(phone) {
	var numbers = /^[0-9]{10}$/;
	if (!phone.value.match(numbers)) {
		return false;
	}
	return true;
}
function valid_Email(email) {
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if (!email.value.match(mailformat)) {
		return false;
	}
	return true;
}
function valid_province(province) {
	if (province.value == "0") {
		return false;
	}
	return true;
}
function valid_address(adress) {
	if (adress.value == "" || address.value == null) {
		return false;
	}
	return true;
}
function valid_roleID(roleID) {
	if (roleID.value == "0") {
		return false;
	}
	return true;
}