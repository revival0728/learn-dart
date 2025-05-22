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

  // Numbers
  // int: Integer values no larger than 64 bits
  // double: 64-bit (double-precision) floating-point numbers, as specified by the IEEE 754 standard.
  // Both int and double are subtypes of num

  // String
  // You can concatenate strings using adjacent string literals or the + operator
  var str_var = "var";
  var formatted_str = "format ${str_var}";
  assert(formatted_str == "format var");
  var conj_str = "aa" + "bb";
  assert(conj_str == "aabb");
  var multi_str_1 = '''
  Multiple
  lines
  of
  String
  ''';
  var multi_str_2 = """
  Multiple
  lines
  of
  String
  """;
  var raw_str = r"\n\n\n\n\r\r\r\r\r\\b\b\\b\b\";

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

  // Collections
  // more detail usage: https://dart.dev/libraries/dart-core
  // List
  var list = [1, 2, 3];
  var list_const = const [1, 2, 3];

  // Set
  // A set in Dart is an unordered collection of unique elements. 
  // Dart support for sets is provided by set literals and the Set type.
  var set = {1, 2, 3};
  var set_empty = <int>{};
  final set_const = const {1, 2, 3};
  set_empty.add(4);
  set_empty.addAll(set);
  assert(set_empty.length == 4);

  // Map
  var map = {
    "key1": 1,
    "key2": 2,
  };
  var map_empty = Map<String, int>();
  map_empty["key1"] = 1;  // Add a key-value pair
  map_empty["key2"] = 2;  // Add a key-value pair
  map_empty["key1"] = 3;  // Modify "key1" to 3
  assert(map["key3"] == null);
  final map_const = const {"key1": 1, "key2": 2};

  // Null-Aware: https://dart.dev/language/collections#null-aware-element
  // Require Dart 3.8.0

  // Spread elements
  var spread_list = [8, 9, 0, ...list];  // [8, 9, 0, 1, 2, 3]
  print(spread_list);

  // If elements
  var bool_true = true;
  var if_list_1 = [0, if(bool_true) 1, 2, 3];  // [0, 1, 2, 3]
  var if_list_2 = [0, if(!bool_true) 1 else 4, 2, 3];  // [1, 4, 2, 3]
  print(if_list_1);
  print(if_list_2);

  Object if_obj = 123;
  var obj_info = [
    if(if_obj case int i) "if_obj is int $i",
    if(if_obj case String s) "if_obj is String $s",
    if(if_obj case bool b) "if_obj is bool $b",
    if(if_obj case double d) "if_obj is double $d",
  ];  // ["if_obj is int 123", "if_obj is double 123"]
  print(obj_info);
  void if_elements_example_1() {
    var word = 'hello';
    var items = [
      1,
      if (word case String(length: var wordLength)) wordLength,
      3,
    ]; // [1, 5, 3]
    print(items);
  } if_elements_example_1();
  void if_elements_example_2() {
    var orderDetails = ['Apples', 12, ''];
    var summary = [
      'Product: ${orderDetails[0]}',
      if (orderDetails case [_, int qty, _]) 'Quantity: $qty',
      if (orderDetails case [_, _, ''])
        'Delivery: Not Started'
      else
        'Delivery: In Progress',
    ]; // [Product: Apples, Quantity: 12, Delivery: Not Started]
    print(summary);
  } if_elements_example_2();
  var if_else_list = [0, if(!bool_true) 1 else if(!bool_true) 2 else 3];  // [0, 3]
  var for_list = [for(int i = 0; i < 3; ++i) i * i];  // [0, 1, 4]
  var nested_for_if_list = [
    for(int i = 0; i < 10; ++i)
      if(i % 2 == 0)
        i *i
  ];  // [0, 4, 16, 36, 64]
  print(if_else_list);
  print(for_list);
  print(nested_for_if_list);
}
