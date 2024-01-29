import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/styles.dart';

class WidgetCurrentDate extends StatelessWidget {
  const WidgetCurrentDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 120,
        decoration: const BoxDecoration(
          color: thirdColor,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Stack(
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                color: whiteColor,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      DateFormat.d().format(DateTime.now()),
                      style: myTextTheme.headlineMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat.MMMM().format(DateTime.now()),
                      style: myTextTheme.headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
