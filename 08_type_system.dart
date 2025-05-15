// The Dart language is type safe: 
//  it uses a combination of static type checking and runtime checks to ensure 
//  that a variable's value always matches the variable's static type, 
//  sometimes referred to as sound typing. Although types are mandatory, 
//  type annotations are optional because of type inference.

// Soundness:
//  Soundness is about ensuring your program can't get into certain invalid states. 
//  A sound type system means you can never get into a state 
//  where an expression evaluates to a value that doesn't match the expression's static type

// A type is acceptable if and only if its the type it self or subtype

class Element {}
class BaseSheet {
  Element get data => Element();
}

class Integer extends Element {}
class DataSheet extends BaseSheet {
  // Valid
  @override
  Integer get data => Integer();
  // Invalid
  // @override
  // ByteCode get data => ByteCode();
}

class ExcelSheet<E extends Element> extends BaseSheet {}
ExcelSheet<E> getExcelSheet<E extends Element>() {
 return ExcelSheet();
}

void main() {
  BaseSheet sheet_1 = getExcelSheet();
  BaseSheet sheet_2 = DataSheet();

  Element data_1 = sheet_1.data;  // Element
  Element data_2 = sheet_2.data;  // Integer (override)
}