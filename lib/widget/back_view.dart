import 'package:flutter/material.dart';

import '../constant.dart';

class BackView extends StatelessWidget {
  const BackView({super.key, required this.monthIndex});
  final int monthIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text((monthIndex + 1).toString(), textScaler: const TextScaler.linear(2.5)),
        const SizedBox(height: 5.0),
        Text(
          monthNames[monthIndex],
          textScaler: const TextScaler.linear(2),
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: GridView.builder(
            itemCount: monthDays[monthIndex],
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1 / 1,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (_, i) {
              int day = i + 1;
              int actualMonth = monthIndex + 1;
              String cDay = day < 10 ? '0$day' : '$day';
              String cMonth = actualMonth < 10 ? '0$actualMonth' : '$actualMonth';
              DateTime date = DateTime.parse('2026-$cMonth-$cDay');
              bool isWeekend =
                  date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;

              return Text(
                '$day',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: date.weekday == DateTime.sunday
                      ? Colors.red
                      : date.weekday == DateTime.saturday
                      ? Colors.blue
                      : Colors.black,
                ),
              );
            },
          ),
        ),
        const Text(
          'Select a date to write',
          textScaler: TextScaler.linear(0.8),
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
