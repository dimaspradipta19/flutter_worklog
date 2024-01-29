import 'dart:developer';

import 'package:flutter/material.dart';

import '../utils/styles.dart';

Widget WidgetContainerFilter(BuildContext context) {
  return Expanded(
    flex: 3,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Filtered by",
              style: myTextTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.w600, color: blackColor),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Container(
                        color: whiteColor,
                        child: DropdownMenu(
                          hintText: "Period",
                          dropdownMenuEntries: const [
                            DropdownMenuEntry(label: "Today", value: 1),
                          ],
                          onSelected: (value) {
                            log(value.toString());
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Container(
                        color: whiteColor,
                        child: DropdownMenu(
                          hintText: "Projects",
                          dropdownMenuEntries: const [
                            DropdownMenuEntry(label: "Today", value: 1),
                          ],
                          onSelected: (value) {
                            log(value.toString());
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
