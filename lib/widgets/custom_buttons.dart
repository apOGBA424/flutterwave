import 'package:flutter/material.dart';
import 'package:pay_to_flutterwave/constants/util.dart';

class ActiveButton extends StatelessWidget {
  const ActiveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        height: 80,
        width: 100,
        child: const Text(
          'Yes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        decoration: BoxDecoration(
          color: Util.activeColor,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
