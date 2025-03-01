import '../models/nic_model.dart';

// Utility class to decode NIC details
class NICDecoder {
  static NICModel decodeNIC(String nic) {
    if (nic.length != 10 && nic.length != 12) {
      throw FormatException('Invalid NIC number: Must be 10 or 12 characters long.');
    }

    NICModel model = NICModel();
    model.nic = nic;

    int dayOfYear;
    if (nic.length == 10) {
      // Old NIC format (e.g., 901234567V)
      model.birthYear = '19${nic.substring(0, 2)}'; // Assuming 1900s for old NICs
      dayOfYear = int.parse(nic.substring(2, 5));
    } else if (nic.length == 12) {
      // New NIC format (e.g., 199012345678)
      model.birthYear = nic.substring(0, 4);
      dayOfYear = int.parse(nic.substring(4, 7));
    } else {
      throw FormatException('Invalid NIC number');
    }

    // Validate dayOfYear: In Sri Lanka, NIC assumes every year has 366 days
    if (dayOfYear < 1 || dayOfYear > 366) {
      throw FormatException('Invalid day of year in NIC number.');
    }

    // Determine gender based on dayOfYear
    if (dayOfYear > 500) {
      dayOfYear -= 500;
      model.gender = 'Female';
    } else {
      model.gender = 'Male';
    }

    // Calculate date of birth (assuming every year is a leap year)
    DateTime date = _getDateOfBirth(int.parse(model.birthYear!), dayOfYear);

    // Adjust for non-leap years
    if (!_isLeapYear(date.year) && dayOfYear > 59) {
      date = date.subtract(Duration(days: 1));
    }

    model.dateOfBirth = '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';

    // Calculate age
    final currentDate = DateTime.now();
    int age = currentDate.year - date.year;
    if (currentDate.isBefore(DateTime(currentDate.year, date.month, date.day))) {
      age--;
    }
    model.age = age.toString();

    // Voting eligibility: Age >= 18
    model.votingEligibility = age >= 18 ? 'Eligible' : 'Not Eligible';

    // Weekday calculation
    model.weekday = _getWeekday(date);

    return model;
  }

  // Helper method to calculate date of birth from year and day of year
  static DateTime _getDateOfBirth(int year, int dayOfYear) {
    // Start from January 1st of the given year and add (dayOfYear - 1) days
    return DateTime(year, 1, 1).add(Duration(days: dayOfYear - 1));
  }

  // Helper method to get the weekday name from a date
  static String _getWeekday(DateTime date) {
    const weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return weekdays[date.weekday - 1];
  }

  // Helper method to check if a year is a leap year
  static bool _isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }
}