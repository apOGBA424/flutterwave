import 'package:flutter/material.dart';
import 'package:flutterwave_standard/flutterwave.dart';
// import 'package:flutterwave_standard/models/subaccount.dart';
import 'package:pay_to_flutterwave/constants/util.dart';
import 'package:uuid/uuid.dart';

import '../constants/secret_keys.dart';
import '../widgets/modal_box.dart';

class PayPage extends StatefulWidget {
  const PayPage({Key? key}) : super(key: key);

  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  final formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final currencyController = TextEditingController();
  final narrationController = TextEditingController();
  final publicKeyController = TextEditingController();
  final encryptionKeyController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  String selectedCurrency = "";

  bool isTestMode = false; //true;
  final pbk = "FLWPUBK_TEST";

  @override
  Widget build(BuildContext context) {
    currencyController.text = selectedCurrency;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('pay page'),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              //
              //amount textfield
              Container(
                padding: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: amountController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: "Amount",
                    border: InputBorder.none,
                  ),
                  validator: (value) =>
                      value!.isNotEmpty ? null : "Amount is required",
                ),
              ),

              //currency textfield
              Container(
                padding: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: currencyController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  readOnly: true,
                  onTap: _openBottomSheet,
                  decoration: const InputDecoration(
                    hintText: "Currency",
                    border: InputBorder.none,
                  ),
                  validator: (value) =>
                      value!.isNotEmpty ? null : "Currency is required",
                ),
              ),

              //public_key textfield
              Container(
                padding: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: publicKeyController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Public Key",
                    border: InputBorder.none,
                  ),
                ),
              ),

              //encrypted key textfield
              Container(
                padding: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: encryptionKeyController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Encryption Key",
                    border: InputBorder.none,
                  ),
                ),
              ),

              //email textfield
              Container(
                padding: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: "Email",
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    return value!.isNotEmpty ? null : 'valid e-mail required';
                  },
                ),
              ),

              //phone number textfield
              Container(
                padding: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: phoneNumberController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: "Phone Number",
                    border: InputBorder.none,
                  ),
                  validator: (value) =>
                      value!.isNotEmpty ? null : "Mobile Number required",
                ),
              ),

              //isTest mode switch
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Use Debug"),
                    Switch(
                      onChanged: (value) => {
                        setState(() {
                          /****TestModeSwitchValue==>293***/
                          isTestMode = value;
                        })
                      },
                      value: isTestMode,
                    ),
                  ],
                ),
              ),

              //make payment button
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: ElevatedButton(
                  onPressed: _onPressed,
                  child: const Text(
                    "Make Payment",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //confirm payment function calling
  _onPressed() {
    if (formKey.currentState!.validate()) {
      _handlePaymentInitialization();
    }
  }

  //confirm payment function
  _handlePaymentInitialization() async {
    final style = FlutterwaveStyle(
      /*to be used in Line 266*/
      appBarText: "Your data are protected",
      buttonColor: Util.activeColor,
      buttonTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      appBarColor: Colors.white,
      dialogCancelTextStyle: const TextStyle(
        color: Util.inActiveColor,
        /****reduced the opacity of activeColor****/
        fontSize: 18,
      ),
      dialogContinueTextStyle: const TextStyle(
        color: Util.activeColor,
        fontSize: 18,
      ),
      mainBackgroundColor: Colors.white,
      mainTextStyle: const TextStyle(
          color: Colors.black54, fontSize: 19, letterSpacing: 2),
      dialogBackgroundColor: Colors.white,
      appBarIcon: const Icon(
        /****changed the appBar icon****/
        Icons.vpn_lock_rounded,
        size: 52,
        /****changed the appBar icon color****/
        color: Util.activeColor,
      ),
      /*"Pay $selectedCurrency${amountController.text}",*/
      buttonText: 'Okay. Proceed!',
      appBarTitleTextStyle: const TextStyle(
        wordSpacing: 2,
        color: Util.activeColor,
        fontSize: 18,
      ),
    );

    final Customer customer = Customer(
      name: 'myself', //"FLW Developer",
      phoneNumber: phoneNumberController.text,
      email: emailController.text,
    ); //"customer@customer.com");

    // final subAccounts = [
    //   SubAccount(
    //       id: "RS_1A3278129B808CB588B53A14608169AD",
    //       transactionChargeType: "flat",
    //       transactionPercentage: 25),
    //   SubAccount(
    //       id: "RS_C7C265B8E4B16C2D472475D7F9F4426A",
    //       transactionChargeType: "flat",
    //       transactionPercentage: 50)
    // ];

    final Flutterwave flutterwave = Flutterwave(
      context: context,
      style: style,
      /*created in Line 218*/
      publicKey: publicKeyController.text.trim().isEmpty
          ? getPublicKey()
          : publicKeyController.text.trim(),
      currency: selectedCurrency,
      txRef: const Uuid().v1(),
      amount: amountController.text.toString().trim(),
      customer: customer,
      // subAccounts: subAccounts, //***what does this represent ????************/
      paymentOptions: "card, payattitude",
      /*in Customization,add title, purpose of payment and BusinessOwner's Logo here*/
      customization: Customization(title: "Test Payment", logo: ''),
      redirectUrl: "https://www.google.com",
      isTestMode: false, //will change value to true if on LiveMode****
      meta: {
        'modeType': 'Live',
        'Payment for:': 'test flutter mobileApp payment to Flutterwave',
      },
    ); //
    final ChargeResponse response = await flutterwave.charge();

    /* here i changed "response!=null" to "response.transactionId != null"*/
    if (response.transactionId != null) {
      /*this function created in Line375********************/
      showLoading(Util.successTitle + Util.successBody);
      print("${response.toJson()}" + Util.successTitle + Util.successBody);
    } else {
      showLoading("No Response!");
    }
  }

  // String getPublicKey() {
  //   if (isTestMode) return  "FLWPUBK_TEST-02b9b5fc6406bd4a41c3ff141cc45e93-X";
  //   return "FLWPUBK-X";
  // }
  String getPublicKey() {
    if (isTestMode) {
      return ApiKEY.testPublicKey;
    } //"FLWPUBK_TEST-02b9b5fc6406bd4a41c3ff141cc45e93-X";
    return ApiKEY.livePublicKey; //"FLWPUBK-X";
  }

  void _openBottomSheet() {
    /*this function is used in Line 81*/
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return _getCurrency();
        });
  }

  Widget _getCurrency() {
    /*used in Line 299*/
    final currencies = ["NGN", "RWF", "UGX", "ZAR", "USD", "GHS", "TZS"];
    return Container(
      height: 250,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      color: Colors.white,
      child: ListView(
        children: currencies
            .map((currency) => ListTile(
                  onTap: () => {_handleCurrencyTap(currency)},
                  title: Column(
                    children: [
                      Text(
                        currency,
                        textAlign: TextAlign.start,
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 4),
                      const Divider(height: 1)
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }

  _handleCurrencyTap(String currency) {
    /*this function is used in line 312*/
    setState(() {
      selectedCurrency = currency;
      currencyController.text = currency;
    });
    Navigator.pop(context);
  }

  Future<void> showLoading(String message) {
    /*this function is called in 
  Line 309 and 312*/
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: SizedBox(
            // i replaced Container widget with SizedBox widget
            /*
            Redesign The Modalbox To Have:
              - CompanyLogo positioned top-center 1/2 offset
              - Success report
              - Greeting message and,
                response description
              - demissal button positioned on bottom-RHS
            */
            //the modalBox
            child: PaymentReplyBox(), // child: Text(message),
            width: double.infinity,
            height: 180,
          ),
        );
      },
    );
  }
}
