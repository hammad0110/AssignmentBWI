import 'package:basicauth/provider/auth_provider.dart';
import 'package:basicauth/screens/home_screen.dart';
import 'package:basicauth/screens/user_information_screen.dart';
import 'package:basicauth/screens/welcome_screen.dart';
import 'package:basicauth/utils/utils.dart';
import 'package:basicauth/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      body: SafeArea(
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 25, 99, 255), //rgba(2,65,99,255)
                ),
              )
            : Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                  child: Column(
                    children: [
                      Align(
                        heightFactor: 0,
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: const Text(
                              "SKIP",
                              style: TextStyle(color: Colors.red),
                            )),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                      Container(
                        width: 380,
                        height: 340,
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          "assets/image2.png",
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.black12,
                                blurRadius: 55.0,
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(9900))),
                        height: 100,
                        width: 160,
                        child: Image.asset(
                          fit: BoxFit.fitWidth,
                          "assets/screen3.png",
                        ),
                      ),
                      SizedBox(height: 33),
                      Pinput(
                        length: 6,
                        showCursor: true,
                        defaultPinTheme: PinTheme(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black45,
                            ),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onCompleted: (value) {
                          setState(() {
                            otpCode = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Resend Code in 55s",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: CustomButton(
                          text: "CONTINUE",
                          onPressed: () {
                            if (otpCode != null) {
                              verifyOtp(context, otpCode!);
                            } else {
                              showSnackBar(context, "Enter 6-Digit code");
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "By continuing you agree to our ",
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Terms & Conditions",
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 5, 63, 244))),
                            TextSpan(
                                text: " and ",
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 5, 63, 244)))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  // verify otp
  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
      context: context,
      verificationId: widget.verificationId,
      userOtp: userOtp,
      onSuccess: () {
        // checking whether user exists in the db
        ap.checkExistingUser().then(
          (value) async {
            if (value == true) {
              // user exists in our app
              ap.getDataFromFirestore().then(
                    (value) => ap.saveUserDataToSP().then(
                          (value) => ap.setSignIn().then(
                                (value) => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                    (route) => false),
                              ),
                        ),
                  );
            } else {
              // new user
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserInfromationScreen()),
                  (route) => false);
            }
          },
        );
      },
    );
  }
}
