import 'package:flutter/material.dart';

import '../constants/util.dart';
import '../main.dart';

class PaymentReplyBox extends StatelessWidget {
  const PaymentReplyBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Util.successTitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    Util.successBody,
                    style: const TextStyle(fontSize: 12, color: Colors.black38),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      child: const Text('Okay'),
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
              ],
            ),
          ),

          //the logo badge and position
          Positioned(
            top: -45,
            left: 85,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Util.activeColor,
                border: Border.all(width: 2, color: Colors.white),
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
            ),
          )
        ],
      ),
      height: 180,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(width: 0.8, color: Colors.white),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
              color: Util.inActiveColor.withOpacity(0.06),
              offset: const Offset(50, 70),
              spreadRadius: 10,
              blurRadius: 60),
        ],
      ),
    );
  }
}
