import 'package:card_validator/utils/constants.dart';
import 'package:card_validator/view/card_display_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'view_model/card_validation_viewmodel.dart';

final getX = GetStorage();
Constants cardDetails = Constants();
void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CardValidationViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Card Validator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: CardDisplay(),
      ),
    );
  }
}
