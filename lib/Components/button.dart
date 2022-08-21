import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? buttonText;
  final VoidCallback? onPressed;
  final Widget? child;

  const CustomButton({
    Key? key,
    @required this.onPressed,
    this.buttonText,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // style: ElevatedButton.styleFrom(
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      // ),
      onPressed: onPressed,
      child: Text(
        '$buttonText',
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}
