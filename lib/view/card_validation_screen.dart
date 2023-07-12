import 'package:card_validator/components/card_details.dart';
import 'package:card_validator/view_model/card_validation_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardValidator extends StatelessWidget {
  const CardValidator({super.key});

  @override
  Widget build(BuildContext context) {
    CardValidationViewModel cardValidationViewModel =
        context.watch<CardValidationViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF323232),
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        elevation: 0,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 240, 239, 239),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Text(
              "Card Validation",
              style: TextStyle(
                color: Color.fromARGB(255, 240, 239, 239),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CardDetails(
              //   textTitle: "Holder name",
              //   textController: cardValidationViewModel.holderName,
              // ),
              // const SizedBox(
              //   height: 12,
              // ),
              CardDetails(
                textTitle: "Card number",
                textController: cardValidationViewModel.cardNumber,
                cardLogo: cardValidationViewModel.cardType,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  cardValidationViewModel.detectCardType(value);
                },
              ),
              const SizedBox(
                height: 12,
              ),
              CardDetails(
                textTitle: "Issuing Country",
                textController: cardValidationViewModel.issuingCountry,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Banned Countries",
                    style: TextStyle(
                      color: Color(0xFF323232),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              CardDetails(
                textTitle: "CVV",
                textController: cardValidationViewModel.cvv,
                keyboardType: TextInputType.number,
                textFieldWidth: 150,
              ),
              const SizedBox(
                height: 150,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF323232),
                    ),
                    elevation: MaterialStateProperty.all<double>(0),
                  ),
                  onPressed: () {
                    if (cardValidationViewModel.cardNumber.text.isNotEmpty) {
                      // if (cardValidationViewModel.holderName.text.isNotEmpty) {
                      if (cardValidationViewModel.cvv.text.isNotEmpty) {
                        if (cardValidationViewModel
                            .issuingCountry.text.isNotEmpty) {
                          cardValidationViewModel.runDelayedCode(context);
                        }
                      }
                      // }
                    }
                  },
                  child: cardValidationViewModel.buttonWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
