extension CharacterValidation on String {
  bool containsUpper() {
    for (var i = 0; i < length; i++) {
      final code = codeUnitAt(i);
      if (code >= 65 && code <= 90) return true;
    }
    return false;
  }

  bool containsLower() {
    for (var i = 0; i < length; i++) {
      final code = codeUnitAt(i);
      if (code >= 97 && code <= 122) return true;
    }
    return false;
  }

  bool containsSpecialChar() {
    for (var i = 0; i < length; i++) {
      final char = this[i];
      if (r'#?!@$%^&*-_.,/[]{}|;:+='.contains(char)) return true;
    }
    return false;
  }

  bool containsUsernameSpecial() {
    for (var i = 0; i < length; i++) {
      final char = this[i];
      // ignore: prefer_single_quotes
      if (r"#?!@$%^&*,/[]{}|;:+=".contains(char)) return true;
    }
    return false;
  }

  bool containsNumber() {
    for (var i = 0; i < length; i++) {
      final code = codeUnitAt(i);
      if (code >= 48 && code <= 57) return true;
    }
    return false;
  }
}
