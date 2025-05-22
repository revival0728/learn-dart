// Dart is a true object-oriented language, so even functions are objects and have a type, Function.
// The Function object is a Callable Object.
// Lexical scope
// Lexical closures
// Tear-offs: it's valid to directly pass function as parameter
// Testing functions for equality: function of different instances are different, otherwise they are equal

bool isEven_1(int num) {
  return num % 2 == 0;
}

bool isEven_2(int num) => num % 2 == 0;


const int INT64_MAX = 9223372036854775807;
int _fpow(int a, int b, int M) {
  assert(b >= 0);
  int ret = 1;
  for(; b > 0; b >>= 1, a = a * a % M) {
    if(b & 1 == 1)
      ret = ret * a % M;
  }
  return ret;
}
// Named parameters
// The "required" keyword require callers to provide a value for parameter
int fpow_1({required int a, required int b, int? M}) {
  if(M == null)
    M = 1000000007;
  return _fpow(a, b, M);
}
// With default value => developer can determine M is nullable or not
int fpow_2({required int a, required int b, int M = 1000000007}) {
  return _fpow(a, b, M);
}
int fpow_3({required int a, required int b, int? M = 1000000007}) {
  if(M == null)
    M = INT64_MAX;
  return _fpow(a, b, M);
}

// Optional positional parameters
int fpow_4(int a, int b, [int? M]) {
  if(M == null)
    M = 1000000007;
  return _fpow(a, b, M);
}
// With default value => developer can determine M is nullable or not
int fpow_5(int a, int b, [int M = 1000000007]) {
  return _fpow(a, b, M);
}
int fpow_6(int a, int b, [int? M = 1000000007]) {
  if(M == null)
    M = INT64_MAX;
  return _fpow(a, b, M);
}

// Function types
typedef FpowNamePara = int Function({required int a, required int b, int? M});
typedef FpowOptPosPara = int Function(int, int, [int?]);
FpowNamePara fpow_t1 = fpow_1;
FpowOptPosPara fpow_t2 = fpow_4;


// Generators
// async generator -> Stream<>
Stream<int> asynchronousNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) yield k++;
}
// sync generator -> Iterable<>
Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    // If your generator is recursive, you can improve its performance by using yield*
    yield* naturalsDownFrom(n - 1);
  }
}


void main(List<String> args) {
  assert(fpow_1(a: 2, b: 10) == 1024);
  assert(fpow_4(2, 10) == 1024);
  assert(fpow_t1(a: 2, b: 10) == 1024);
  assert(fpow_t2(2, 10) == 1024);

  // Anonymous functions
  // ([[Type] param1[, ...]]) {
  //    codeBlock;
  // }
  final fpow_a1 = (int a, int b) {
    return _fpow(a, b, (1e9 + 7).toInt());
  };
  final fpow_a2 = (int a, int b) => _fpow(a, b, (1e9 + 7).toInt());
  assert(fpow_a1(2, 10) == 1024);
  assert(fpow_a2(2, 10) == 1024);

}