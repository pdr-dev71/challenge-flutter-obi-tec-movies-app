import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;
  final Widget? text;
  final Color? backgroundColor;
  final Size? fixedSize;
  const CustomButtom({
    Key? key,
    required this.onPressed,
    this.child,
    this.text,
    this.backgroundColor,
    this.fixedSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screenWith = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        //minimumSize: const Size.fromHeight(60),
        fixedSize: fixedSize ?? Size(screenWith * 0.9, screenHeight * 0.07),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
