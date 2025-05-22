// Using libraries
import 'dart:math';
import '01_hello.dart';

// Specifying a library prefix
import 'dart:math' as math;

// Importing only part of a library
// Import all except Element
import '08_type_system.dart' hide Element;
// Only import Element
import '08_type_system.dart' show Element;

// Lazily loading a library
// Deferred loading (also called lazy loading) allows a web app to load a library on demand, 
// if and when the library is needed. 
// Use deferred loading when you want to meet one or more of the following needs.
// The dart tool doesn't support deferred loading for targets other than web.
// import 'dart:collection' deferred as collection;

void main() {
  assert(math.pi == pi);
  // collection.loadLibrary().then((_) { // Use library
  //   // Or using "await collection.loadLibrary()" instead
  //   return;
  // });
}