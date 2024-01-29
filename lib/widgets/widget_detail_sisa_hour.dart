import 'package:flutter/material.dart';

import '../utils/styles.dart';

class WidgetDetailSisaHour extends StatelessWidget {
  const WidgetDetailSisaHour({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "3.00 Hours",
            style: myTextTheme.headlineSmall,
          ),
          Text(
            "This Week",
            style: myTextTheme.titleMedium!.copyWith(color: greyColor3),
          ),
        ],
      ),
    );
  }
}
