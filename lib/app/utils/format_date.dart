String formatDate(DateTime dateTime) {
  Map<int, String> months = {
    1: 'January',
    2: 'February',
    3: 'March',
    4: 'April',
    5: 'May',
    6: 'June',
    7: 'July',
    8: 'August',
    9: 'September',
    10: 'October',
    11: 'November',
    12: 'December'
  };

  String day = dateTime.day.toString();
  String month = months[dateTime.month]!;
  String year = dateTime.year.toString();

  return '$day $month, $year';
}
