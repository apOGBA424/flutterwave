// import 'package:flutter/material.dart';
// import 'package:flutterwave_standard/core/flutterwave.dart';
// import 'package:flutterwave_standard/models/requests/customizations.dart';
// import 'package:flutterwave_standard/models/responses/charge_response.dart';
// import 'package:flutterwave_standard/view/flutterwave_style.dart';
// import 'package:pay_to_flutterwave/constants/util.dart';

// // import '../constants/util.dart';
// import '/constants/secret_keys.dart';
// import '/constants/util.dart';

// class IndexPage extends StatelessWidget {
//   const IndexPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Payment Page'),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {},
//               child: const Text('Pay'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// //flutter code integretion here

// _handlePaymentInitialization() async {

//     final style = FlutterwaveStyle(
//         appBarText: "My Standard Blue",
//         buttonColor: const Color(0xffd0ebff),
//         appBarIcon: Icon(Icons.message, color: Color(0xffd0ebff)),
//         buttonTextStyle: TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//           fontSize: 18,
//         ),
//       appBarColor: Color(0xffd0ebff),
//       dialogCancelTextStyle: TextStyle(
//         color: Colors.redAccent,
//         fontSize: 18,
//       ),
//       dialogContinueTextStyle: TextStyle(
//         color: Colors.blue,
//         fontSize: 18,
//       )
//     );
//   final Flutterwave flutterwave = Flutterwave(context: context, publicKey: ApiKEY.testPublicKey, txRef: Util.textReference, amount: PayAmount.test500, customer: Util.utilCustomer, paymentOptions: Util.payOption[1], customization: Customization(title: CustomizationValue.testTitle), isTestMode: AppMode.statusFalse,);
// }

// // final ChargeResponse response = await flutterwave.charge();
// // if (response != null) {
// //   print(response.toJson());
// //   if(response.success) {
// //     // Call the verify transaction endpoint with the transactionID returned in `response.transactionId` to verify transaction before offering value to customer
// //   } else {
// //    // Transaction not successful
// //   }
// // } else {
// //   // User cancelled
// // }