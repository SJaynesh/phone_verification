import 'package:flutter/material.dart';
import 'package:phone_verification/utills/helpers/auth_helper.dart';
import 'package:pinput/pinput.dart';

class OTPVerificationPage extends StatelessWidget {
  OTPVerificationPage({super.key});
  String otp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "OTP Verification",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Pinput(
              length: 6,
              onChanged: (val) {
                otp = val;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () async {
                Map<String, dynamic> res =
                    await AuthHelper.authHelper.checkMyOTP(otp: otp);

                if (res['user'] != null) {
                  SnackBar snackBar = const SnackBar(
                    content: Text("Otp Verification Successfully"),
                    backgroundColor: Colors.green,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'home_page', (route) => false);
                }

                if (res['error'] != null) {
                  SnackBar snackBar = const SnackBar(
                    content: Text("Otp Verification Unsuccessfully"),
                    backgroundColor: Colors.red,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              label: const Text("OTP Verified"),
              icon: const Icon(Icons.call),
            ),
          ],
        ),
      ),
    );
  }
}
