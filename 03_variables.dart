// Declare variable with "var", dart will determine the variable type with its initial value
var string_type_var = "string";

// Or declare with type, class, enum, etc.
String string_type_var_specific = "string";

// The late modifier has two use cases:
// * Declaring a non-nullable variable that's initialized after its declaration.
// * Lazily initializing a variable.
// This keyword prevent dart from checking if the varialbe is initialized before used
// The reponsibility of null check relies on developer
late String description;

// Constant varialbes can be declared with "const" and "final"
// A "const" variable value will be determined at compile time (compile-time constant)
// A "final" varaible value will be determined at runtime
// Instance variables can be final but not const.
const int const_int = 1;
final int final_int = 1;
final String final_str = "str";
var foo = const [];
final bar = const [];
const baz = []; // Equivalent to `const []`

// You can define constants that use type checks and casts (is and as), 
// collection if, and spread operators (... and ...?):
const Object obj_i = 3; // Where i is a const Object with an int value...
const const_list = [obj_i as int]; // Use a typecast.
const const_map = {if (obj_i is int) obj_i: 'int'}; // Use is and collection if.
const const_set = {if (const_list is List<int>) ...const_list}; // ...and a spread.

// Wildcard variables: meaningless variables
void func(void g(int _, bool _)) {}