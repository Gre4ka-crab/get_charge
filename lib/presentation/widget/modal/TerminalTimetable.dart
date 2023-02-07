import 'package:flutter/material.dart';

class TerminalTimetable extends StatelessWidget {
  const TerminalTimetable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        height: 6,
        margin:
            const EdgeInsets.only(top: 8, bottom: 16, right: 160, left: 160),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 241, 241, 241),
            borderRadius: BorderRadius.circular(3)),
      ),
      Container(
        margin: const EdgeInsets.only(left: 31, right: 31, bottom: 19),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('График работы'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text('Пн-пт'), Text('10:00 - 22:00')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text('Сб-вс'), Text('10:00 - 22:00')],
            )
          ],
        ),
      ),
    ]);
  }
}
