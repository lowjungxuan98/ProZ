extension IntegerExtension on int {
  String toWeekDayFirstChar() {
    switch (this) {
      case 1:
        return "M";
      case 2:
        return "T";
      case 3:
        return "W";
      case 4:
        return "T";
      case 5:
        return "F";
      case 6:
        return "S";
      case 0:
        return "S";
      default:
        return "TextError";
    }
  }
}
