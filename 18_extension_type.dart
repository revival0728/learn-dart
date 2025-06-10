// An extension type is a compile-time abstraction 
// that "wraps" an existing type with a different, 
// static-only interface.
// Extension types serve the same purpose as wrapper classes, 
// but don't require the creation of an extra run-time object, 
// which can get expensive when you need to wrap lots of objects

final int M = (1e9 + 7).toInt();

extension type Modular._(int i) {
  Modular(int i) : this._(i % M);
  Modular.fromDouble(double d) : this(d.toInt());
  Modular.fromString(String s) : this(int.parse(s));

  Modular rev() {
    int r = 1, a = i, b = M - 2;
    for(; b > 0; b >>= 1, a = a * a % M) {
      if(b & 1 == 1)
        r = r * a % M;
    }
    return Modular(r);
  }

  Modular operator +(Modular other) => Modular(i + other.i);
  Modular operator -(Modular other) => Modular(i + other.i);
  Modular operator *(Modular other) => Modular(i * other.i);
  Modular operator /(Modular other) => Modular(i * other.rev().i);
}

// An extension type also an "implements" of other class
// Its (int) representation type.
extension type NumberI(int i) implements int {
  // 'NumberI' can invoke all members of 'int',
  // plus anything else it declares here.
}
// A supertype of its (List<T>) representation type. 
extension type Sequence<T>(List<T> _) implements Iterable<T> {
  // Better operations than List.
}
extension type Id(int _id) implements Object {
  // Makes the extension type non-nullable.
  static Id? tryParse(String source) => int.tryParse(source) as Id?;
}