RegExp _numeric = RegExp(r'[0-9]');
bool isNumeric(String str) {
  return _numeric.hasMatch(str);
}
