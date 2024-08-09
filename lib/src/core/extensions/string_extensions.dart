// Project imports:
import 'package:todo_app/src/core/extensions/date_extensions.dart';

extension TimeExtension on String {
  DateTime get toDate => DateTime.parse(this);

  String get capiTalizeFirst {
    return this[0].toUpperCase() + substring(1);
  }

  String get capiTalizeFirstLast {
    return this[0].toUpperCase() + substring(1);
  }

  String get capitalizeFullname {
    if (isEmpty) return this;

    List<String> words = split(" ");
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] = words[i][0].toUpperCase() + words[i].substring(1);
      }
    }

    return words.join(" ");
  }

  String reArrangeDOB(String pattern, [String newPattern = '-']) {
    return split(pattern).reversed.join(newPattern);
  }

  String removeCommas() {
    if (contains(',')) {
      return replaceAll(',', '');
    } else {
      return this;
    }
  }

  String obscuredMail() {
    var newString = '';
    final List<String> emailList = split("");
    for (var i = 0; i < emailList.length; i++) {
      if (i != 0 && emailList[i] != '@' && i < indexOf('.')) {
        emailList[i] = '*';
        newString = emailList.join();
      }
    }
    return newString;
  }

  String obscurePhoneNumber() {
    if (length >= 10) {
      final List<String> numberList = split("");
      for (var i = 3; i < 7; i++) {
        // Replace digits from index 3 to 6 with '*'
        numberList[i] = '*';
      }
      return numberList.join();
    } else {
      // Handle cases where the phone number is too short
      return this;
    }
  }

  String truncateToMaxLength(int maxLength) {
    if (length <= maxLength) {
      return this;
    }
    return substring(0, maxLength);
  }

  String get toMonthDate {
    return DateTime.parse(this).toMonthDate;
  }

  String get toTime {
    return DateTime.parse(this).toTime;
  }

  String get initials {
    final name = split(' ');

    if (name.length > 1) {
      return '${name[0][0]}${name[1][0]}';
    }
    return name[0][1];
  }

  String get maskedCardNumber {
    // Remove all non-digit characters
    final cleaned = replaceAll(RegExp(r'\D'), '');

    // Mask all but the last 4 digits
    final masked = cleaned.replaceAll(RegExp(r'\d(?=\d{4})'), '*');

    // Add spaces between every four digits
    final spaced = masked.replaceAllMapped(
        RegExp(r".{4}"), (match) => "${match.group(0)} ");

    // Trim any trailing space
    return spaced.trim();
  }
}

extension TimeFormat on int {
  String toDeliveryTime() {
    if (this < 60) {
      return '${this}mins';
    } else {
      int hours = this ~/ 60;
      int minutes = this % 60;
      if (hours > 0 && minutes > 0) {
        return '$hours${hours > 1 ? 'hrs' : 'hr'} ${minutes}mins';
      } else if (hours > 0) {
        return '$hours${hours > 1 ? 'hrs' : 'hr'}';
      } else {
        return '${minutes}mins';
      }
    }
  }
}

String getGreeting(String userName) {
  late String greeting;

  int hours = DateTime.now().hour;

  if (hours >= 0 && hours <= 12) {
    greeting = "Good Morning $userName 👋";
  } else if (hours >= 12 && hours <= 16) {
    greeting = "Good Afternoon $userName 🌞";
  } else if (hours >= 16 && hours <= 21) {
    greeting = "Good Evening $userName 😋";
  } else if (hours >= 21 && hours <= 24) {
    greeting = "Good Night $userName 🛌🏻";
  }

  return greeting;
}

extension StringExtensions on String? {
  String? get nullIfEmpty {
    if (this == null || this!.trim().isEmpty) {
      return null;
    }
    return this;
  }
}
