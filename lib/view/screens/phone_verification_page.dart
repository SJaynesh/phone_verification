import 'package:flutter/material.dart';
import 'package:phone_verification/utills/helpers/auth_helper.dart';

class PhoneVerificationPage extends StatelessWidget {
  PhoneVerificationPage({super.key});

  String phone = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Phone Verification",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            TextField(
              maxLength: 10,
              onChanged: (val) {
                phone = val;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Enter number...",
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.purple,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                AuthHelper.authHelper
                    .phoneVerification(phoneNumber: phone)
                    .then((value) {
                  Navigator.pushNamed(context, 'otp_verification_page');
                });
              },
              label: const Text("Verified"),
              icon: const Icon(Icons.call),
            ),
          ],
        ),
      ),
    );
  }
}
