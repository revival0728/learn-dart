typedef IntList = List<int>;
typedef Compare<T> = bool Function(T a, T b);

bool less(int a, int b) {
  return a < b;
}

void main() {
  assert(less is Compare<int>);
}