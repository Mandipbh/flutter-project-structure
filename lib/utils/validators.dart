

String? validateName(String? value) {
  String pattern = r'\p{L}';
  RegExp regExp = RegExp(pattern,unicode: true);
  if (value?.isEmpty??false) {
    return "Name is required";
  } else if (!regExp.hasMatch(value ?? '')) {
    return "Name must be A-Z";
  }
  return null;
}

String? validateMobile(String? value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(pattern);
  if (value?.isEmpty??false) {
    return "Mobile number is required";
  } else if (value!.isNotEmpty && !regExp.hasMatch(value ?? '')) {
    return "Mobile number must be 10 digits";
  }
  return null;
}

String? validatePassword(String? value) {
  if(value!.isEmpty){
    return "This field is required";
  }else if(value.isNotEmpty && (value.length ?? 0) < 6){
    return "Password must be longer than 5 characters";
  }
  else {
    return null;
  }
}

String? validateEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if(value!.isEmpty){
    return "This field is required";
  }
  else if (value.isNotEmpty && !regex.hasMatch(value ?? '')) {
    return "Enter a valid email address";
  } else {
    return null;
  }
}

String? validateConfirmPassword(String? password, String? confirmPassword) {
  if (password != confirmPassword) {
    return "Password does not match";
  } else if (confirmPassword?.isEmpty??false) {
    return "Confirm password is required";
  } else {
    return null;
  }
}

String? validateEmpty(String? value) {
  if (value!.isEmpty) {
    return "This field must not be empty";
  } else {
    return null;
  }
}

String? validateLinkUrl(String? value) {
  String pattern =r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+';
  RegExp regex = RegExp(pattern);
  if (value!.isEmpty) {
    return "This field must not be empty";
  } else if (!regex.hasMatch(value ?? '')) {
    return "Enter a valid Link URL";
  }else {
    return null;
  }
}




class Validators {
  // Email Validator
  static bool isValidEmail(String email) {
    final RegExp regex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\$',
    );
    return regex.hasMatch(email);
  }

  // Password Validator
  static bool isValidPassword(String password) {
    return password.length >= 8;
  }

  // Phone Number Validator
  static bool isValidPhoneNumber(String phone) {
    final RegExp regex = RegExp(r'^[0-9]{10}\$');
    return regex.hasMatch(phone);
  }

  // Empty Field Validator
  static bool isNotEmpty(String value) {
    return value.trim().isNotEmpty;
  }

  // Username Validator
  static bool isValidUsername(String username) {
    final RegExp regex = RegExp(r'^[a-zA-Z0-9_]{3,15}\$');
    return regex.hasMatch(username);
  }

  // URL Validator
  static bool isValidUrl(String url) {
    final RegExp regex = RegExp(
      r'^(http|https):\/\/([a-zA-Z0-9.-]+)\.([a-zA-Z]{2,})([\/\w .-]*)*\/?\$');
    return regex.hasMatch(url);
  }

  // Numeric Validator
  static bool isNumeric(String value) {
    final RegExp regex = RegExp(r'^-?[0-9]+(\.[0-9]+)?\$');
    return regex.hasMatch(value);
  }

  // Date Validator (YYYY-MM-DD)
  static bool isValidDate(String date) {
    final RegExp regex = RegExp(
      r'^\d{4}-\d{2}-\d{2}\$',
    );
    return regex.hasMatch(date);
  }

  // Custom Length Validator
  static bool hasMinLength(String value, int minLength) {
    return value.length >= minLength;
  }

  static bool hasMaxLength(String value, int maxLength) {
    return value.length <= maxLength;
  }

  // Confirm Password Validator
  static bool isPasswordMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }
}
