import 'package:flutter/material.dart';

class ColumnComponent extends StatelessWidget {
  final Widget head;
  final String tailLabel;
  final TextStyle tailStyle;
  final double? spaceHight;
  const ColumnComponent(
      {super.key,
      required this.head,
      required this.tailLabel,
      required this.tailStyle,
      this.spaceHight = 15});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            head,
            SizedBox(
              height: spaceHight,
            ),
            Text(
              tailLabel,
              style: tailStyle,
              softWrap: true,
            ),
          ],
        ),
      ],
    );
  }
}
