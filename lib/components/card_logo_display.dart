import 'package:flutter/material.dart';

class CardLogoDisplay extends StatelessWidget {
  CardLogoDisplay({super.key, this.cardLogo});

  List<String>? cardLogo = [
    // "assets/visa_card.png",
    // "assets/master_card.jpg",
    // "assets/american_express_card.jpg",
    // "assets/discover_card.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cardLogo!.length,
        itemBuilder: (context, i) {
          return Image.asset(cardLogo![i]);
        },
      ),
    );
  }
}
