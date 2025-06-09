import 'dart:math' show sqrt;

class Point {
  final double x, y;

  // a private member variable initialized in the declaration
  final int _planeId = 0;

  // Generative constructors with assert validation during development
  Point(this.x, this.y);

  // Named constructors with initializer list
  Point.zero() : x = 0, y = 0;

  // Constant constructors
  const Point.constPoint(this.x, this.y);

  // Redirecting constructors
  // constructor uses this instead of the class name after a colon
  Point.sameXY(double value) : this(value, value);

  void printInfo() {
    print("x: $x");
    print("y: $y");
    print("planeId: $_planeId");
  }
}

class Vector extends Point {
  static final MAX_X = 1e9;
  static final MAX_Y = 1e9;

  // use "super" to get superclass
  Vector(double x, double y) : assert(x < MAX_X && y < MAX_Y), super(x, y);
  Vector.zero() : this(0, 0);
  const Vector.constVector(double x, double y) : super.constPoint(x, y);
  Vector.sameXY(double value) : this(value, value);

  // Factory constructors
  // Although a factory constructor can't return null, it might return:
  //  an existing instance from a cache instead of creating a new one
  //  a new instance of a subtype
  // Factory constructors can't access "this"
  factory Vector.infVector() {
    return Vector(MAX_X, MAX_Y);
  }

  double getLength() {
    return sqrt(x * x + y * y);
  }

  // Getter
  double get length => getLength();

  // Setter
  set x(double value) => x = value;
  set y(double value) => y = value;

  static double lengthOf(Vector vec) {
    return vec.length;
  }

  // Operators
  // <	>	<=	>=	==	~
  // -	+	/	~/	*	%
  // |	ˆ	&	<<	>>>	>>
  // []=	[]
  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);
  double operator *(Vector v) => x * v.x + y * v.y;
  double operator ^(Vector v) => x * v.y - y * v.x;

  @override
  void printInfo() {
    super.printInfo();
    print("length: $length");
  }
}

void main() {
  var vec1 = Vector.sameXY(1);
  var vec12 = Vector(1, 2);
  var vecZero = Vector.zero();
  var vecConst1 = Vector.constVector(1, 1);
  var vecConst2 = const Vector.constVector(1, 1);
  // identical: exposes whether two object references refer to the same object.
  assert(!identical(vec1, vecConst1));
  assert(!identical(vec1, vecConst2));
  assert(!identical(vecConst1, vecConst2));

  // vecList1, vecList2, vecList3 are all constant
  var vecList1 = const [Vector.constVector(1, 1), Vector.constVector(1, 2)];
  var vecList2 = [const Vector.constVector(1, 2), const Vector.constVector(1, 2)];
  const vecList3 = [Vector.constVector(1, 1), Vector.constVector(1, 2)];

  print("Length of vec12: ${vec12.getLength()}");
  print("Length of vec1: ${vec1.length}");
  print("Length of vecZero: ${Vector.lengthOf(vecZero)}");
  print("vec1 dot vec12: ${vec1 * vec12}");
  print("vec1 cross vec12: ${vec1 ^ vec12}");
  print("Info of vec12:");
  vec12.printInfo();
}