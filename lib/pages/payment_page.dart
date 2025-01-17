import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/pages/delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      _showConfirmPaymentDialog();
    }
  }

  void _showConfirmPaymentDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirm Payment"),
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
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DeliveryProgressPage()));
            },
            child: Text("Confirm"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildScaffold(context);
  }

  Widget _buildScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text('Payment'),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        _buildCreditCardWidget(context),
        _buildCreditCardForm(context),
        Spacer(),
        _buildPayButton(context),
        SizedBox(
          height: 25,
        )
      ],
    );
  }

  Widget _buildCreditCardWidget(BuildContext context) {
    return CreditCardWidget(
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      showBackView: isCvvFocused,
      onCreditCardWidgetChange: (p0) {},
    );
  }

  Widget _buildCreditCardForm(BuildContext context) {
    return CreditCardForm(
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
        });
      },
      formKey: formKey,
    );
  }

  Widget _buildPayButton(BuildContext context) {
    return MyButton(text: "Pay Now", onTap: userTappedPay);
  }
}
