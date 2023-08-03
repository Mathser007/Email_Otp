import 'dart:async';
import 'package:flutter/material.dart';

import 'new.dart';

void main() {
  runApp( Aspire());
}
class Aspire extends StatelessWidget {
  Aspire({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController email = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        body:
        Form(
          key: _formKey,
          child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      image:DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 161,top: 10),
                  child: Text("Aspire",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,
                      color:Colors.green ),),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 100,right: 20,left: 20),
                          child:Text(("Let’s start with mail"), style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5,right: 20,left: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child:  Text(("Verify mail to login or signup"), style: TextStyle(fontWeight:FontWeight.w400,fontSize: 14,),),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child:
                        Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
                                child: SizedBox(
                                  width: 500,
                                  height: 70,
                                  child: TextFormField(
                                    controller: email,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter Email';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.mail_outline_rounded),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3, color: Colors.greenAccent),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 40,left: 20,right: 20),
                                child: SizedBox(
                                  height: 60,
                                  width: 500,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Processing Data')),

                                        );
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>  Verification(email:email.text.toString())),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green, // Background color
                                    ),
                                    child:  Text(
                                      'Continue',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),

                            ]
                        ),
                      )
                    ]
                ),
                Padding(
                    padding: EdgeInsets.only(left: 80,top: 150),

                    child:  Text(("By taping continue you are agreeing our "),style: TextStyle(fontSize: 15),)),
                Padding(
                    padding: EdgeInsets.only(left: 100),

                    child: Row(
                        children: [
                          Text((" Privacy Policy "),style: TextStyle(fontWeight:FontWeight.bold,fontSize: 15),),

                          Text(("and "),style: TextStyle(fontSize: 15),),
                          Text(("Terms of use"),  style: TextStyle(fontWeight:FontWeight.bold,fontSize: 15))
                        ]
                    )
                )
              ]
          ),
        )

    );
  }
}

// Align(
// alignment:Alignment.bottomCenter,
// child:
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
//
// ],
// ),
// ],

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Home()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        child:Image.asset("assets/images/logo1.png")
    );
  }
}
Widget build(BuildContext context) {
  return  Scaffold(

  );
}