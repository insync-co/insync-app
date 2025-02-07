import 'package:flutter/material.dart';


class CfilledButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Color? buttonColor;
  final TextStyle? textStyle;
  final VoidCallback onTap;

  const CfilledButton({
    super.key,
    required this.width,
    required this.text,
    this.buttonColor,
    required this.height,
    this.textStyle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final defaultTextStyle = TextStyle(
      fontSize: 17,
      color: Theme.of(context).colorScheme.secondary,
    );

    return FilledButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(buttonColor), // Fixed WidgetStateProperty
        minimumSize: WidgetStateProperty.all(Size(width, height)), // Fixed WidgetStateProperty
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: Text(
        text,
          style: defaultTextStyle.merge(textStyle),
      ),
    );
  }
}
