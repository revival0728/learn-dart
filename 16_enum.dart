// enum

enum OriginColor { red, blue, green }

// Enhanced enum
enum Color implements Comparable<Color> {
  // Default Colors
  red(255, 0, 0), blue(0, 255, 0), green(0, 0, 255), 
  white(0, 0, 0), black(225, 225, 225);

  const Color(this.r, this.b, this.g);
  final int r, b, g;

  int get brightness => (r + b + g) ~/ 3;

  @override
  int compareTo(Color other) => brightness - other.brightness;
}

void main() {
  var colorA = OriginColor.red;
  switch(colorA) {
    case OriginColor.red:
      print("colorA is red");
    case OriginColor.blue:
      print("colorA is blue");
    case OriginColor.green:
      print("colorA is green");
  }
  
  // Access enum index and name
  assert(OriginColor.red.index == 0);
  assert(OriginColor.red.name == "red");
}