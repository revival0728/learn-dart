void main() {
  // Numbers (int, double)
  // Strings (String)
  // Booleans (bool)
  // Records ((value1, value2))
  // Functions (Function)
  // Lists (List, also known as arrays)
  // Sets (Set)
  // Maps (Map)
  // Runes (Runes; often replaced by the characters API)
  // Symbols (Symbol)
  // The value null (Null)

  // Records
  // Can be pair, tuple, dictionary, or mixed
  // Extension types: https://dart.dev/language/extension-types
  (int, int) int_pair = (1, 1);
  (String, int) str_int_pair = ("str", 1);
  ({int a, bool b}) ab_dict = (a: 123, b: true);
  var record_mixed = ('first', a: 2, b: true, 'last');
  print(record_mixed.$1); // Prints 'first'
  print(record_mixed.a); // Prints 2
  print(record_mixed.b); // Prints true
  print(record_mixed.$2); // Prints 'last'

  (int, int) multi_return_val_func_1() { return (1, 2); }
  (int one, int two) multi_return_val_func_2() { return (1, 2); }
  ({int one_3, int two_3}) multi_return_val_func_3() { return (one_3: 1, two_3: 2); }
  var (one_1, two_1) = multi_return_val_func_1();
  var (one_2, two_2) = multi_return_val_func_2();
  var (:one_3, :two_3) = multi_return_val_func_3();
}