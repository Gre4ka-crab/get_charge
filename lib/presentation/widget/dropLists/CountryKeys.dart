// import 'package:flutter/material.dart';
//
// class CountryKeys extends StatefulWidget {
//   final TextEditingController textController;
//
//   const CountryKeys({Key? key, required this.textController}) : super(key: key);
//
//   @override
//   State<CountryKeys> createState() => _CountryKeysState();
// }
//
// class _CountryKeysState extends State<CountryKeys> {
//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, String>> countryKeys = [{'+7': ''}];
//
//     return DropdownButton<Map<String, String>>(
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.deepPurple),
//       underline: Container(
//         height: 2,
//         color: Colors.deepPurpleAccent,
//       ),
//       onChanged: (Map<String, String>? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       items: countryKeys.map<DropdownMenuItem<Map<String, String>>>(
//           (String key, String value) {
//         return DropdownMenuItem<String, String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }
