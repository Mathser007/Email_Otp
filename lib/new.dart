
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import 'main.dart';

class Verification extends StatefulWidget {
  final  String email;
  Verification({required this.email});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  OtpFieldController otp = OtpFieldController();
  EmailOTP myauth = EmailOTP();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myauth.setConfig(
        appEmail: "akhilaku18@gmail.com",
        appName: "Email OTP",
        userEmail: widget.email,
        otpLength: 4,
        otpType: OTPType.digitsOnly
    );
    sendotp();
  }
  Future<void> sendotp() async {
    if (await myauth.sendOTP() == true) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(
        content: Text("OTP has been sent"),
      ));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(
        content: Text("Oops, OTP send failed"),
      ));
    }
  }
  Widget build(BuildContext context) {
    return  Scaffold(
        body:ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:10,left: 10,right: 330),
              child: IconButton(onPressed: (
                  ){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              }, icon: Icon(Icons.arrow_back_outlined)),
            ),
            Padding(
              padding: const EdgeInsets.only(top:30,left: 155,right: 154),
              child: SizedBox(
                height: 130,
                width: 81,
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60,left: 10),
              child: Text("Verification",
                style:TextStyle(fontWeight: FontWeight.w600,fontSize: 18) ,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1,left: 10),
              child: Text("Verification code has been sent to",
                style:TextStyle(fontWeight: FontWeight.w400,fontSize: 14) ,),
            ),
            Padding(
              padding: const EdgeInsets.only(top:1,left: 10),
              child: Text("test@hotmail.com",
                style:TextStyle(fontWeight: FontWeight.w500,fontSize: 14) ,),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 47,left: 10),
              child: OTPTextField(
controller: otp,
                length: 4,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 54,
                style: TextStyle(
                    fontSize: 17
                ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin){

                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
              child: SizedBox(
                height: 50,
                width: 500,
                child: ElevatedButton(onPressed: ()
                async
                {
                  {
                    if (await myauth.verifyOTP(otp:otp) == true) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                  content: Text("OTP is verified"),
                  ));
                  } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                  content: Text("Invalid OTP"),
                  ));
                  }
                }

                },
                    child: Text("Verify&Continue"),style: ElevatedButton.styleFrom(
                      primary: Colors.green,)
                ),
              ),
            ),
            TextButton(onPressed: ()async{
    if (await myauth.sendOTP() == true) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(
    content: Text("OTP has been sent"),
    ));
    } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(
    content: Text("Oops, OTP send failed"),
    ));
    }
    },
                child: Text("Resend code",style: TextStyle(
                    fontWeight: FontWeight.w400,fontSize: 14
                ),))

          ],
        )
    );
  }
}

