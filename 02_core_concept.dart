// Everything in "dart" are "Object"
Object obj_int = 1;
Object obj_double = 1.0;
Object obj_string = "abc";

// Null will be treated as subtype of every type if nullable
Object? obj_nullabe = null;
int? int_nullable = null;
double? double_nullabe = null;

// Add "!" to use the variable with null assertion
Object obj_not_nullalbe = obj_nullabe!;  // cause runtime error

// Support Generic
List<int>? list_int;  // list_int == null

// Private Feild: If an identifier starts with an underscore (_), it's private to its library
Object? _obj_private;

// Expression has value, but statement does not.