import 'dart:async';

import 'package:card_validator/main.dart';
import 'package:card_validator/utils/dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/credit_card_class.dart';

class CardValidationViewModel extends ChangeNotifier {
  TextEditingController cardNumber = TextEditingController();
  TextEditingController cvv = TextEditingController();
  TextEditingController holderName = TextEditingController();
  TextEditingController issuingCountry = TextEditingController();
  List<Map<String, dynamic>>? validatedCards =
      getX.read(cardDetails.getXValidatedCards);
  // CardValidationViewModel.write("validatedVards", validatedCards);
  List<String> cardType = [
    "assets/visa_card.png",
    "assets/master_card.jpg",
    "assets/american_express_card.jpg",
    "assets/discover_card.png",
  ];
  bool isValidating = false;
  List<String> bannedCountries = [
    'afghanistan',
    'belarus',
    'cuba',
    'iran',
    'iraq',
    'north Korea',
    'somalia',
    'sudan',
    'syria',
    'yemen',
  ];

  loadingIndicator() {
    isValidating = true;
    notifyListeners();
  }

  bool validateCreditCard(String cardNumber) {
    cardNumber = cardNumber.replaceAll(RegExp(r'[\s-]+'), '');

    CardType cardType = detectCardType(cardNumber);
    bool isValid = validateLuhnAlgorithm(cardNumber);

    isValidating = false;
    notifyListeners();
    return isValid;
  }

  CardType detectCardType(String cardNumber) {
    // Remove any spaces or dashes from the card number
    cardNumber = cardNumber.replaceAll(RegExp(r'[\s-]+'), '');
    if (cardNumber.isNotEmpty) {
      if (cardNumber.startsWith('4')) {
        print("VISA");
        cardType = ["assets/visa_card.png"];
        notifyListeners();
        return CardType.Visa;
      } else if (cardNumber.startsWith('5')) {
        print("MASTER");
        cardType = ["assets/master_card.jpg"];
        notifyListeners();
        return CardType.MasterCard;
      } else if (cardNumber.startsWith('34') || cardNumber.startsWith('37')) {
        print("AMERICANEXPRESS");
        cardType = ["assets/american_express_card.jpg"];
        notifyListeners();
        return CardType.AmericanExpress;
      } else if (cardNumber.startsWith('6')) {
        print("DISCOVER");
        cardType = ["assets/discover_card.png"];
        notifyListeners();
        return CardType.Discover;
      } else {
        print("UNKNOWN");
        return CardType.Unknown;
      }
    } else {
      cardType = [
        "assets/visa_card.png",
        "assets/master_card.jpg",
        "assets/american_express_card.jpg",
        "assets/discover_card.png",
      ];
      notifyListeners();
      return CardType.Unknown;
    }
  }

  bool validateLuhnAlgorithm(String cardNumber) {
    // Reverse the card number
    List<int> reversedDigits =
        cardNumber.split('').reversed.map(int.parse).toList();

    int sum = 0;
    int digit;
    bool isSecondDigit = false;

    for (int i = 0; i < reversedDigits.length; i++) {
      digit = reversedDigits[i];

      if (isSecondDigit) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }

      sum += digit;
      isSecondDigit = !isSecondDigit;
    }

    return sum % 10 == 0;
  }

  void runDelayedCode(BuildContext context) {
    // Delay execution by 2 seconds
    loadingIndicator();
    Timer(Duration(seconds: 5), () {
      // Code to be executed after the delay
      bool isValid = validateCreditCard(cardNumber.text);
      print(isValidating);
      if (isValid) {
        if (bannedCountries.contains(issuingCountry.text.toLowerCase())) {
          showMyDialog(context, "Banned Issuing Country");
          cardNumber.clear();
          holderName.clear();
          cvv.clear();
          issuingCountry.clear();
        } else {
          print("Card is Valid");
          // List<Map<String, dynamic>> validatedCard = [];
          validatedCards!.add({
            "cardNumber": cardNumber.text,
            "cardType": cardType,
            "cvv": cvv.text,
            "issuingCountry": issuingCountry.text
          });
          notifyListeners();
          getX.write(cardDetails.getXValidatedCards, validatedCards);
          showMyDialog(context, "Validation Complete");
          cardNumber.clear();
          holderName.clear();
          cvv.clear();
          issuingCountry.clear();
          cardType = [
            "assets/visa_card.png",
            "assets/master_card.jpg",
            "assets/american_express_card.jpg",
            "assets/discover_card.png",
          ];
          notifyListeners();
        }
      } else {
        showMyDialog(context, "Invalide Card");
        print("Invalide Card");
      }
    });
  }

  buttonWidget() {
    return isValidating
        ? const SizedBox(
            height: 20,
            child: CircularProgressIndicator(
              color: Color.fromARGB(255, 240, 239, 239),
            ),
          )
        : const Text(
            "Validate",
            style: TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 240, 239, 239),
            ),
          );
  }
}
