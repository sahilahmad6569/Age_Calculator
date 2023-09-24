class AgeCalculator {
  static int calculateAge(String dateStr) {
    List<String> dateParts = dateStr.split('/');
    if (dateParts.length != 3) {
      return -1; // Invalid date format
    }

    int day = int.tryParse(dateParts[0]) ?? -1;
    int month = int.tryParse(dateParts[1]) ?? -1;
    int year = int.tryParse(dateParts[2]) ?? -1;

    if (day < 1 || day > 31 || month < 1 || month > 12 || year < 1) {
      return -1; // Invalid date components
    }

    final currentDate = DateTime.now();
    DateTime birthDate = DateTime(year, month, day);

    int age = currentDate.year - birthDate.year;
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }
    return age;
  }
}
