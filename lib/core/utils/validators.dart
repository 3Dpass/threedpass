class Validators {
  static bool checkPassword(final String pass) {
    final reg = RegExp(r'^(?![0-9]+$)(?![a-zA-Z]+$)[\S]{6,32}$');
    return reg.hasMatch(pass);
  }
}
