extension FormatNumbers on num {
  String get formatedRate {
    String temp = toString();
    return temp.substring(0, 3);
  }
}
