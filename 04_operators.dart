void main() {
  // "as"	Typecast (also used to specify library prefixes)
  // "is"	True if the object has the specified type
  // "is!"	True if the object doesn't have the specified type
  int int_var = 1;
  double double_var = int_var as double;
  assert(int_var is int);
  assert(double_var is double);
  assert(int_var is! double);

  // To assign only if the assigned-to variable is null, use the ??= operator.
  int one = 1, two = 2;
  int? int_nullable;
  int_nullable ??= one;
  int_nullable ??= two;
  assert(int_nullable == one);

  // Conditional expressions
  String condition_str = int_nullable == one ? "is one" : "not one";

  // Cascade notation
  // Cascades (.., ?..) allow you to make a sequence of operations on the same object. 
  var buf_a = StringBuffer();
  var buf_b = StringBuffer();
  buf_a
    ..write("abc")
    ..write("def");
  buf_b.write("abc");
  buf_b.write("def");
  assert(buf_a.toString() == buf_b.toString());

  // Spread operators
  // The spread operator isn't actually an operator expression. 
  // The .../...? syntax is part of the collection literal itself. 
  // So, you can learn more about spread operators on the Collections page.
}