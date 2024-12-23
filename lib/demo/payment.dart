import 'package:flutter/material.dart';
import 'package:flutter_upi_payment/flutter_upi_payment.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String text = "Click Pay to start the transaction.";

  Future<void> makePayment() async {
    try {
      final upiApps = await FlutterUpiPayment.getUPIApps();

      if (upiApps.isNotEmpty) {
        final response = await FlutterUpiPayment.initiateTransaction(
          upiId: 'mohammedabidah15-1@oksbi',
          payeeName: 'Mohammed Abid Ahmed',
          amount: '1',
          mode: '05',
          orgId: '000000',
          appPackageName: upiApps[1].packageName,
          // transactionRef: 'TXN123',
          // transactionNote: 'Payment for goods',
          //merchantCode: 'MERCHANT123',
          //merchantId: 'MERCHANT456',
          //storeId: 'STORE789',
          //terminalId: 'TERMINAL000',
        );

        setState(() {
          text = "Payment ${response.status}"; // Update the UI
        });
      } else {
        setState(() {
          text = "No UPI apps found.";
        });
      }
    } catch (e) {
      setState(() {
        text = "Error: $e"; // Display error
      });
      debugPrint("Payment error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UPI Payment Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                makePayment();
              },
              child: const Text('Pay'),
            ),
            const SizedBox(height: 20),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
