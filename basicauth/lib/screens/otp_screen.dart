import 'dart:async';

import 'package:basicauth/provider/auth_provider.dart';
import 'package:basicauth/screens/home_screen.dart';
import 'package:basicauth/screens/home_ss.dart';
import 'package:basicauth/screens/user_information_screen.dart';
import 'package:basicauth/utils/utils.dart';
import 'package:basicauth/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  int secondsRemaining = 30;
  bool enableResend = false;
  late Timer timer;

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      backgroundColor: Colors.white,
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
                      const SizedBox(height: 3),
                      Container(
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 55.0,
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(9900))),
                        height: 120,
                        width: 140,
                        child: Image.asset(
                          fit: BoxFit.fitWidth,
                          "assets/screen3.png",
                        ),
                      ),
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
                      const SizedBox(height: 18),
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
                      const SizedBox(height: 22),
                      Container(
                        alignment: Alignment.center,
                        width: 320,
                        child: InkWell(
                          child: Text(
                            "Didn't receive the OTP? Retry in $secondsRemaining seconds",
                            style: GoogleFonts.robotoMono(
                                color: const Color.fromARGB(255, 64, 67, 79),
                                fontSize: 11),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: 90,
                        child: InkWell(
                          onTap: () => enableResend ? _resendCode() : null,
                          child: Text(
                            "Resend OTP",
                            style: TextStyle(
                                fontSize: 14,
                                color: enableResend
                                    ? const Color.fromARGB(255, 32, 76, 252)
                                    : Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Raleway'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: "By continuing you agree to our ",
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Terms & Conditions",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 5, 63, 244))),
                            TextSpan(
                                text: " and ",
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 5, 63, 244)))
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
                                      builder: (context) => const HomeScreen1(),
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

  void _resendCode() {
    //other code here
    setState(() {
      secondsRemaining = 30;
      enableResend = false;
    });
  }

  @override
  dispose() {
    timer.cancel();
    super.dispose();
  }
}
