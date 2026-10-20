import 'package:flutter/material.dart';

import '../constant.dart';

class FrontView extends StatelessWidget {
  const FrontView({super.key, required this.monthIndex});
  final int monthIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          (monthIndex + 1).toString(),
          textScaler: const TextScaler.linear(3),
          style: const TextStyle(color: Colors.white),
        ),
        Text(
          monthNames[monthIndex],
          textScaler: const TextScaler.linear(2.5),
          style: const TextStyle(color: Colors.white),
        ),
        const Spacer(),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '6/${monthDays[monthIndex]}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 3),
                  Container(
                    width: double.infinity,
                    height: 3,
                    color: Colors.white30,
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 6 / 31,
                      child: Container(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.more_vert_rounded, color: Colors.white, size: 30),
          ],
        ),
      ],
    );
  }
}
