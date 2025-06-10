// Extension methods add functionality to existing libraries.

// The name "NumberParsing" are used when export to other library using "hide" and "show"
// https://dart.dev/language/extension-methods#api-conflicts
extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }
}

void main() {
  String a = "1";
  assert(a.parseInt() == 1);
}