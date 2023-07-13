import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/card_validation_viewmodel.dart';


class BannedCountries extends StatelessWidget{
const BannedCountries({super.key});

  @override
  Widget build(BuildContext context) {
    CardValidationViewModel bannedCountries =
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
              "Banned Countries",
              style: TextStyle(
                color: Color.fromARGB(255, 240, 239, 239),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: bannedCountries.bannedCountries.length,
              itemBuilder: (BuildContext context, int index) {
                String country = bannedCountries.bannedCountries[index];
                return ListTile(
                  title: Text(country),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      bannedCountries.removeBannedCountry(country);
                    },
                  ),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: bannedCountries.bannedCountry,
                    onChanged: (value) {
                      // Handle user input for new country
                    },
                    decoration: const InputDecoration(
                      labelText: 'Add Banned Country',
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF323232),
                    ),
                    elevation: MaterialStateProperty.all<double>(0),
                  ),
                  onPressed: () {
                    bannedCountries.addBannedCountry(
                        bannedCountries.bannedCountry.text.trim());
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      color: Color.fromARGB(255, 240, 239, 239),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BannedCountries(),
  ));
}
