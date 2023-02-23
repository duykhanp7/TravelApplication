class AppValidator {
  static String? validateTextFieldFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your first name';
    }
    return null;
  }

  static String? validateTextFieldLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your last name';
    }
    return null;
  }

  static String? validateTextFieldCountry(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your country';
    }
    return null;
  }

  static String? validateTextFieldEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else {
      final bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value);
      if (!emailValid) {
        return 'Email is invalid';
      }
    }
    return null;
  }

  static String? validateTextFieldPhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    } else {
      final bool phoneNumberValid =
          RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
              .hasMatch(value);
      if (!phoneNumberValid) {
        return 'Phone number is invalid';
      }
    }
    return null;
  }

  static String? validateTextFieldPasword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else {
      final bool paswordValid = RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
          .hasMatch(value);
      if (!paswordValid) {
        return 'Password should have at least 8 characters\nMust have : number, upper, lower characters, special characters';
      }
    }
    return null;
  }

  static String? validateTextFieldPaswordLogIn(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else {
      final bool paswordValid = RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
          .hasMatch(value);
      if (!paswordValid) {
        return 'Password should have at least 8 characters\nMust have : number, upper, lower characters, special characters';
      }
    }
    return null;
  }

  static String? validateTextFieldConfirmPasword(
      String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.trim() != password.trim()) {
      return 'Password is not the same';
    }
    return null;
  }
}
