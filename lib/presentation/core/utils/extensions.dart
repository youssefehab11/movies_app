extension NumbersFormat on num {
  String get formatedRate {
    String temp = toString();
    return temp.substring(0, 3);
  }
}

extension FormatString on String {
  String get formatedDate {
    print(this);
    if (length >= 4) {
      return substring(0, 4);
    }
    return this;
  }

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
  String get formatnumOfLikes {
    if (this >= 1000) {
      return '${this ~/ 1000}k';
    }
    return '$this';
  }

  String get formatvideoStreamDuration {
    if (this < 10) {
      return '0$this';
    }
    return '$this';
  }
}
