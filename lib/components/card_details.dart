import 'package:card_validator/components/card_logo_display.dart';
import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget {
  CardDetails({
    super.key,
    required this.textTitle,
    required this.textController,
    this.keyboardType = TextInputType.name,
    this.textFieldWidth,
    this.cardLogo,
    this.onChanged,
  });
  String textTitle;
  TextEditingController textController;
  double? textFieldWidth = double.infinity;
  List<String>? cardLogo;
  Function(String)? onChanged;
  TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textTitle,
              style: TextStyle(fontSize: 18),
            ),
            const Spacer(),
            textTitle == "Card number"
                ? Expanded(
                    flex: 2,
                    child: CardLogoDisplay(
                      cardLogo: cardLogo,
                    ),
                  )
                : const SizedBox()
          ],
        ),
        SizedBox(
          height: 50,
          width: textFieldWidth,
          child: TextField(
            controller: textController,
            onChanged: onChanged,
            keyboardType: keyboardType,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(15, 25, 15, 5),
              // hintText: "0000 0000 0000 0000",
              // hintStyle: TextStyle(
              //   color: Color.fromARGB(255, 128, 125, 125),
              // ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: const Color(0xFF323232),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
