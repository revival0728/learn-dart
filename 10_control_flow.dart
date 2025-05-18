void main() {
  // For loops
  for(var i = 0; i < 5; ++ i) {
    print(i);
  }
  var list = [1, 2, 3, 4, 5];
  var map = {"key1": 1, "key2": 2};
  // for var in Itarable
  for(var i in list) {
    print(i);
  }
  for(var k in map.keys) {
    print("$k: ${map[k]}");
  }

  // while and do-while
  var tmp = [];
  while(tmp.length < 5) {
    tmp.add(tmp.length);
  }
  print(tmp);
  tmp = [];
  do {
    tmp.add(tmp.length);
  } while(tmp.length < 5);
  print(tmp);

  // labels (can be used with any loop)
  outerLoop:
  for(var i = 0; i < 3; ++i) {
    for(var j = 0; j < 3; ++j) {
      if((i + j) % 2 == 0)
        continue outerLoop;
      print("(i, j) = ($i, $j)");
    }
  }
}