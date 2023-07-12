import 'package:flutter/material.dart';

showMyDialog(BuildContext context, String content) {
  return showDialog<void>(
    context: context,
    // barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        actionsPadding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
        content: Text(
          content,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        actions: <Widget>[
          Center(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
