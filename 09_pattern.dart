enum Color {
  red,
  blue,
  green,
}

class Shape {
  int size = 0;
}
class Square extends Shape {}

void main () {
  // In general, a pattern may match a value, destructure a value, or both, 
  // depending on the context and shape of the pattern.
  // Pattern allows recursively mathcing.
  // For more detail pattern types: https://dart.dev/language/pattern-types

  // Matching
  var number = 1;
  switch(number) {
    case 1:
      print("one");
  }

  // Destructuring
  var record = (1, 2, 3);
  var list = [1, 2, 3];
  var (r_one, r_two, r_three) = record;
  var [l_one, l_two, l_three] = list;
  var nested = ((1, 2, [3]), [4, 5]);
  var ((n_one, n_two, [n_three]), [n_four, n_five]) = nested;

  // Other pattern
  switch(number) {
    case >= 1:
      print("greater equal than one");
    case <= 1:
      print("less equal than one");
  }
  void pattern_match(Object obj) {
    switch(obj) {
      case (int a, int b, var c) when a > b:
        print("obj is (int, int, var) and a > b");
      case (var a, var b, var c):
        print("obj is record: ($a, $b, $c)");
      case [var a, var b, var c]:
        print("obj is list: [$a, $b, $c]");
    }
  }
  pattern_match(record);
  pattern_match(list);

  // switch with return value
  var color = Color.blue;
  var notGreen = switch(color) {
    Color.blue || Color.red => true,
    Color.green => false,
  };

  // Deconstructing a class
  var shape = Square();
  switch(shape) {
    case Square(size: var s):
      print("shape is square");
  }

  // MapEntry(key, value)
  var map = {"key1": 1, "key2": 2};
  print("Map:");
  for(var MapEntry(:key, value: v) in map.entries) {
    print("$key: $v");
  }

  if(record case (1, 2, 3)) {
    print("record == (1, 2, 3)");
  }
  if(record case (1, 2, var c)) {
    print("record == (1, 2, $c)");
  }
}