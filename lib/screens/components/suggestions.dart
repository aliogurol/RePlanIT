import 'package:responsive_admin_dashboard/models/laptop_info_model.dart';

class SuggestionProvider {
  static String getSuggestion(int score) {
    if (score == 0) {
      return "buy new laptops with same specs";
    } else if (score == 40) {
      return 'Replace curent laptops by refurbished with the same specs.';
    } else if (score == 50) {
      return 'Keep using current laptops';
    } else if (score == 70) {
      return 'Keep using current laptops';
    } else {
      return '-';
    }
  }

  static int calculateScore(LaptopData laptop) {
    // Perform calculations based on laptop properties and return a score
    int score = 0;
    if (laptop.status == 'New') {
      score = 0;
    } else if (laptop.status == 'refurbished' || laptop.status == 'repaired') {
      score += 40;
    } else if (laptop.status == 'extend support 1 year') {
      score += 50;
    } else if (laptop.status == 'extend support 2 years') {
      score += 70;
    } else {
      score += 10;
    }

    // RegExp numberPattern = RegExp(r'\d+');

    // Use the pattern to find the first number in the string
    // String extractedNumber = numberPattern.stringMatch(laptop.ramSize).toString();
    // Convert the extracted string to an integer
    // int extractedInt = int.parse(extractedNumber);    
    // score += extractedInt * 5;
    // score += laptop.storage;
    // if (laptop.isRecyclable) {
    //   score += 10;
    // }
    return score;
  }
}
