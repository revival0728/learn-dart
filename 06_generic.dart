// Restricting the parameterized type
class BaseElementType {}
class Container<T extends BaseElementType> {}

// Using generic methods
T first<T>(List<T> ts) {
  return ts[0];
}