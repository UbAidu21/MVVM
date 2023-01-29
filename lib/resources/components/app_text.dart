import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  AppText({
    Key? key,
    required this.title,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
  }) : super(key: key);

  String title;
  int? maxLines;
  double? fontSize;
  Color? color;
  FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
