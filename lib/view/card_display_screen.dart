import 'package:card_validator/main.dart';
import 'package:card_validator/view/card_validation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../view_model/card_validation_viewmodel.dart';

class CardDisplay extends StatelessWidget {
  CardDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    CardValidationViewModel validatedcardsList =
        context.watch<CardValidationViewModel>();
    validatedcardsList.validatedCards =
        getX.read(cardDetails.getXValidatedCards);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF323232),
        toolbarHeight: 70,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              "assets/credit_card.png",
              scale: 10,
            ),
            const Text(
              "Validated Cards",
              style: TextStyle(
                color: Color.fromARGB(255, 240, 239, 239),
              ),
            ),
          ],
        ),
      ),
      body: validatedcardsList.validatedCards == null ||
              validatedcardsList.validatedCards!.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset(
                    "assets/empty.svg",
                    height: 100,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "No Validated Card",
                )
              ],
            )
          : ListView.builder(
              itemCount: validatedcardsList.validatedCards!.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: Container(
                    width: double.infinity,
                    // height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 10, 12, 5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "••••${validatedcardsList.validatedCards![i]["cardNumber"].toString().substring(14)}",
                              ),
                              Text(
                                validatedcardsList.validatedCards![i]
                                    ["issuingCountry"],
                              ),
                              // const Spacer(),
                              SizedBox(
                                width: 50,
                                height: 30,
                                child: Image.asset(
                                  validatedcardsList.validatedCards![i]
                                          ["cardType"]
                                      .toString()
                                      .replaceFirst('[', '')
                                      .replaceFirst(']', ''),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => const CardValidator()),
            ),
          );
        },
        backgroundColor: const Color(0xFF323232),
        child: const Center(
          child: Icon(
            Icons.add,
            size: 50,
            color: Color.fromARGB(255, 240, 239, 239),
          ),
        ),
      ),
    );
  }
}
