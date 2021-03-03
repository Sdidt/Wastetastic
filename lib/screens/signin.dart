import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:wastetastic/screens/ForgotPassword.dart';
import 'package:wastetastic/screens/HomeScreen.dart';
import 'package:wastetastic/screens/MainScreen.dart';

final _formKey = GlobalKey<FormState>();

class signin extends StatefulWidget {
  static String id = 'sigin_page';
  @override
  _signinState createState() => _signinState();
}

String enteredPassword;
String enterUsername;

class _signinState extends State<signin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //backgroundColor: Colors.lightGreen[200],
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.green[700], Colors.lime[200]],
                //center: Alignment(0.0, 0.0),
              ),
            ),
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0.0,
                        ),
                        CircleAvatar(
                          radius: 60.0,
                          //backgroundImage: AssetImage('')
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage('assets/images/wastetastic_1.png'),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                        ),
                        SizedBox(
                          width: 120.0,
                          child: TypewriterAnimatedTextKit(
                            text: [
                              "Login",
                            ],
                            textStyle: TextStyle(
                                fontSize: 40.0, fontFamily: "Source Sans Pro"),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) return "Enter Username";
                            enterUsername = value;
                            return null;
                          },
                          cursorColor: Colors.teal[900],
                          maxLength: 30,
                          decoration: InputDecoration(
                            icon: Icon(Icons.person, color: Colors.teal[900]),
                            labelText: 'Username',
                            labelStyle: TextStyle(
                                color: Colors.teal[900], fontSize: 20),
                            // helperText: 'Number of characters',
                            // helperStyle: TextStyle(
                            //     color: Colors.teal[900],
                            //     fontSize: 14
                            // ),
                            //suffixIcon: Icon(Icons.check_circle, color: Colors.teal[900]),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal[900]),
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) return "Enter Password";
                            enteredPassword = value;
                            return null;
                          },
                          cursorColor: Colors.teal[900],
                          maxLength: 30,
                          decoration: InputDecoration(
                            icon: Icon(Icons.vpn_key_rounded,
                                color: Colors.teal[900]),

                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Colors.teal[900], fontSize: 20),
                            // helperText: 'Number of characters',
                            // helperStyle: TextStyle(
                            //     color: Colors.teal[900],
                            //     fontSize: 14
                            // ),
                            //suffixIcon: Icon(Icons.check_circle, color: Colors.teal[900]),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal[900]),
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, ForgotPassword.id);
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                        ),
                        SizedBox(
                          width: 270,
                          height: 60,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                Navigator.pushNamed(context, MainScreen.id);
                              }
                            },
                            color: Colors.lime[50],
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 25.0,
                                color: Colors.teal[900],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
