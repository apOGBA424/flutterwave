// import 'package:flutter/material.dart';
// import 'package:flutterwave_standard/core/flutterwave.dart';
// import 'package:flutterwave_standard/models/requests/customizations.dart';
// import 'package:flutterwave_standard/models/responses/charge_response.dart';
// import 'package:flutterwave_standard/view/flutterwave_style.dart';
// import 'package:pay_to_flutterwave/constants/util.dart';

// // import '../constants/util.dart';
// import '/constants/secret_keys.dart';
// import '/constants/util.dart';




// class PayButton extends StatelessWidget {
//   const PayButton({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap:() async {

//     final style = FlutterwaveStyle(
//         appBarText: "My Standard Blue",
//         buttonColor: const Color(0xffd0ebff),
//         appBarIcon: const Icon(Icons.message, color: Color(0xffd0ebff)),
//         buttonTextStyle: const TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//           fontSize: 18,
//         ),
//       appBarColor: const Color(0xffd0ebff),
//       dialogCancelTextStyle: const TextStyle(
//         color: Colors.redAccent,
//         fontSize: 18,
//       ),
//       dialogContinueTextStyle: const TextStyle(
//         color: Colors.blue,
//         fontSize: 18,
//       )
//     );
//   final Flutterwave flutterwave = Flutterwave(context: context, publicKey: ApiKEY.testPublicKey, txRef: Util.textReference, amount: PayAmount.test500, customer: Util.utilCustomer, paymentOptions: Util.payOption[1], customization: Customization(title: CustomizationValue.testTitle), isTestMode: AppMode.statusFalse,);
// }

// final ChargeResponse response = await flutterwave.charge();
// if (response != null) {
//   print(response.toJson());
//   if(response.success) {
//     // Call the verify transaction endpoint with the transactionID returned in `response.transactionId` to verify transaction before offering value to customer
//   } else {
//    // Transaction not successful
//   }
// } else {
//   // User cancelled
// }

//     );
//   }
// }

