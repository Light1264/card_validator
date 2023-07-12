// import 'package:flutter/material.dart';

// class SortByImagePosition extends StatefulWidget {
//   SortByImagePosition({Key? key, required this.type}) : super(key: key);
//   String type;

//   @override
//   State<SortByImagePosition> createState() => _SortByImagePosition();
// }

// class _SortByImagePosition extends State<SortByImagePosition> {
//   final position = [
//     "Top",
//     "Bottom",
//   ];

//   String? value1;
//   String? value2;

//   @override
//   Widget build(BuildContext context) {
//     value1 = getX.read(userDetails.getXPosition1);
//     value2 = getX.read(userDetails.getXPosition2);
//     return SizedBox(
//       height: 29,
//       width: 95,
//       child: DropdownButton<String>(
//         isExpanded: true,
//         value: widget.type == "1st" ? value1 : value2,
//         underline: const SizedBox(),
//         items: position.map(buildItem).toList(),
//         icon: const Icon(
//           Icons.keyboard_arrow_down_outlined,
//           color: Color.fromRGBO(0, 0, 0, 0.7),
//           size: 30,
//         ),
//         onChanged: (value) {
//           if (widget.type == "1st") {
//             setState(() {
//               value1 = value;
//               getX.write(userDetails.getXPosition1, value1);
//               // getX.write('gender', values);
//             });
//           } else {
//             setState(() {
//               value2 = value;
//               getX.write(userDetails.getXPosition2, value2);
//               // getX.write('gender', values);
//             });
//           }
//         },
//       ),
//     );
//   }

//   DropdownMenuItem<String> buildItem(String item) {
//     return DropdownMenuItem(
//       value: item,
//       child: Row(
//         children: [
//           const SizedBox(
//             width: 12,
//           ),
//           Text(
//             item,
//             style: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w400,
//               color: Color.fromRGBO(0, 0, 0, 0.7),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }