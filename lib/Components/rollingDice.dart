import 'package:flutter/material.dart';

class RollingDice extends StatelessWidget {
  final String ?image;
  final int ?valueKey;
  final Color ?color;

  const RollingDice({
    Key? key,
    @required this.image, this.valueKey, this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Text(image!);
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return RotationTransition(turns: animation, child: child);
      },
      child: Container(
        color: color,
        padding: const EdgeInsets.all(2),
        key: ValueKey<int>(valueKey!),
        child:
            Image.asset(image!, height: 40, width: 40,),
      ),
    );
  }
}
