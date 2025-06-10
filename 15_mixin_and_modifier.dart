import 'dart:math' show sqrt;

// The Modifiers:
// abstract
// base
// final
// interface
// sealed
// mixin
// For more detailed info: https://dart.dev/language/class-modifiers
// This note focus on mixin, abstract

// Abstract classes cannot be constructed from any library, whether its own or an outside library.
abstract class MathConcept {
  void printInfo();
}
abstract class Variable extends MathConcept {
  void printValue();
}

abstract class Number extends Variable {}
abstract class VectorLike extends Variable {
  double length();
}

// These mixins can be used by Variable extended class (Number, VectorLike)
mixin CanAdd on Variable { Variable operator +(Variable other); }
mixin CanMinus on Variable { Variable operator -(Variable other); }

// These mixins can only used by Number
mixin CanMultiply on Number { Variable operator *(Variable other); }
mixin CanDivide on Number { Variable operator /(Variable other); }

// These mixins can only used by Vector
mixin CanDot on VectorLike { Variable operator *(Variable other); }
mixin CanCross on VectorLike { Variable operator ^(Variable other); }

class Complex extends Number with CanAdd, CanMinus {
  final double real, img;

  Complex(this.real, this.img);

  void printInfo() {
    print("Complex:");
    print("Real: $real");
    print("Imagine: $img");
  }
  void printValue() {
    print("C = $real + j$img");
  }
  Variable operator +(Variable other) {
    var c = other as Complex;
    var r = real + c.real, i = img + c.img;
    return i == 0 ? Real(r) : Complex(r, i);
  }
  Variable operator -(Variable other) {
    var c = other as Complex;
    var r = real - c.real, i = img - c.img;
    return i == 0 ? Real(r) : Complex(r, i);
  }
}

class Real extends Number with CanAdd, CanMinus, CanMultiply, CanDivide {
  final double value;

  Real(this.value);

  void printInfo() {
    print("Real:");
    print("value: $value");
  }
  void printValue() {
    print("R = $value");
  }
  Real operator +(Variable other) => Real(value + (other as Real).value);
  Real operator -(Variable other) => Real(value - (other as Real).value);
  Real operator *(Variable other) => Real(value * (other as Real).value);
  Real operator /(Variable other) => Real(value / (other as Real).value);
}

class Vector extends VectorLike with CanAdd, CanMinus, CanDot, CanCross {
  final double a, b;

  Vector(this.a, this.b);

  void printInfo() {
    print("Vector:");
    print("a: $a");
    print("b: $b");
  }
  void printValue() {
    print("Vec = ($a, $b)");
  }
  double length() => sqrt(a * a + b * b);
  Vector operator +(Variable other) {
    var v = other as Vector;
    return Vector(a + v.a, b + v.b);
  }
  Vector operator -(Variable other) {
    var v = other as Vector;
    return Vector(a - v.a, b - v.b);
  }
  Real operator *(Variable other) {
    var v = other as Vector;
    return Real(a * v.a + b * v.b);
  }
  Real operator ^(Variable other) {
    var v = other as Vector;
    return Real(a * v.b - b * v.a);
  }
}

abstract class ProblemLike extends MathConcept {
  Variable? solve();
}

// mixin does not have constuctor
// but can have member variable, function, getter, setter, etc...
mixin Solvable<AnsT extends Variable> on ProblemLike {
  Variable get answer;
  bool Function(Variable)? get checker;

  bool solved = false;

  @override
  AnsT solve();

  bool isAnswerValid() {
    if(checker == null) return true;
    return checker!(answer);
  }
}

class LinearEquation extends ProblemLike {
  // ax + b = c
  final Real a, b, c;

  LinearEquation(this.a, this.b, this.c);

  void printInfo() {
    print("LinearEquation:");
    print("a: $a");
    print("b: $b");
    print("c: $c");
  }
  Real? solve() {
    if(a == 0) return null;
    return (b - c) / a;
  }
}

class LinearEquationSolvable extends LinearEquation with Solvable<Real> {
  LinearEquationSolvable(Real a, Real b, Real c) : assert(a != 0), super(a, b, c);

  Real? cache;

  @override
  Real solve() {
    solved = true;
    return super.solve()!;
  }

  Real get answer => (solved ? cache : cache = solve())!;
  bool Function(Variable)? get checker => null;
}