extension NumbersFormat on num {
  String get formatedRate {
    String temp = toString();
    return temp.substring(0, 3);
  }
}

extension DateFormat on String {
  String get formatedDate => substring(0, 4);
}

extension IntegerFormat on int {
  String get formatedInt {
    if (this >= 1000) {
      return '${this ~/ 1000}k';
    }
    return '$this';
  }
}
