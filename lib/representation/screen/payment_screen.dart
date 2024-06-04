import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:booking_app_source/components/my_button.dart';
import 'package:booking_app_source/representation/screen/main_app.dart';
import 'package:booking_app_source/representation/widgets/app_bar_container.dart';

class PayMentPage extends StatefulWidget {
  const PayMentPage({Key? key}) : super(key: key);

  @override
  State<PayMentPage> createState() => _PayMentPageState();
}

class _PayMentPageState extends State<PayMentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  //pay now
  void userTapped() {
    if (formKey.currentState!.validate()) {
      //show dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Confirm payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number: $cardNumber"),
                Text("Expiry Date: $expiryDate"),
                Text("Card Holder Name: $cardHolderName"),
                Text("CVV: $cvvCode"),
              ],
            ),
          ),
          actions: [
            //confirm
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainApp(),
                ),
              ),
              child: const Text("Yes"),
            ),

            //cancel
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      title: const Padding(
        padding: EdgeInsets.only(left: 170.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'P A Y M E N T',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // credit card
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: (p0) {},
            ),

            //card form
            CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                  isCvvFocused = data.isCvvFocused;
                });
              },
              formKey: formKey,
            ),

            const SizedBox(height: 25),

            MyButton(
              onTap: userTapped,
              text: "Pay now",
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
