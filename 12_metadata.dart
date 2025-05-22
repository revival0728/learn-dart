// Metadata
// Use metadata to give additional information about your code. 
// A metadata annotation begins with the character @, 
// followed by either a reference to a compile-time constant (such as deprecated) 
// or a call to a constant constructor.
// Four annotations are available to all Dart code: @Deprecated, @deprecated, @override, and @pragma

@Deprecated('Use turnOn() instead')
void active() {}
void turnOn() {}


// You can define your own metadata annotations. 
// Here's an example of defining a @Todo annotation that takes two arguments:
class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}

@Todo('Dash', 'Implement this function')
void doSomething() {
  print('Do something');
}