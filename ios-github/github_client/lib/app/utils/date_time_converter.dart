extension RecentDate on DateTime {
  String recentDate() {
    int daysDifference = DateTime.now().difference(this).inDays;
    if (daysDifference < 30) {
      return ' $daysDifference days ago ';
    } else {
      switch (month) {
        case 1:
          return ' on Jan $day';
        case 2:
          return ' on Freb $day';
        case 3:
          return ' on March $day';
        case 4:
          return ' on April $day';
        case 5:
          return ' on May $day';
        case 6:
          return ' on June $day';
        case 7:
          return ' on July $day';
        case 8:
          return ' on Aug $day';
        case 9:
          return ' on Sept $day';
        case 10:
          return ' on Okt $day';
        case 11:
          return ' on Nov $day';
        case 12:
          return ' on Dec $day';
        default:
          throw Exception('DateTime months out of range');
      }
    }
  }
}
