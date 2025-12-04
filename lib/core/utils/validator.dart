class Validator {
  static String? nameValidator(value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  static String? emailValidator(value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email address';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  static String? phoneValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }

    if (value.length != 11) {
      return 'Phone number must be 11 digits';
    }

    final phoneRegex = RegExp(r'^(01)[0-9]{9}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid Egyptian phone number';
    }

    return null;
  }

  static String? passwordValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? confirmPasswordValidator(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
