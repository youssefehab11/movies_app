extension NumbersFormat on num {
  String get formatedRate {
    String temp = toString();
    return temp.substring(0, 3);
  }
}

extension FormatString on String {
  String get formatedDate => substring(0, 4);

  String get formatProfileName {
    List<String> words = split(' ');
    if (words.length <= 2) {
      return words.join(' ');
    } else {
      List<String> firstTwo = words.sublist(0, 2);
      return firstTwo.join(' ');
    }
  }
}

extension IntegerFormat on int {
  String get formatedInt {
    if (this >= 1000) {
      return '${this ~/ 1000}k';
    }
    return '$this';
  }
}
