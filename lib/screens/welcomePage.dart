import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:wastetastic/widgets/SimpleButton.dart';
import 'signin.dart';
import 'signup.dart';

class welcomePage extends StatefulWidget {
  static String id = 'welcome_page';
  @override
  _welcomePageState createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
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
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5.0),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                  ),
                  CircleAvatar(
                    radius: 120.0,
                    //backgroundImage: AssetImage('')
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        AssetImage('assets/images/wastetastic_1.png'),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                  ),
                  SizedBox(
                    width: 250.0,
                    child: TypewriterAnimatedTextKit(
                      onTap: () {
                        print("Tap Event");
                      },
                      text: [
                        "Wastetastic",
                      ],
                      textStyle: TextStyle(
                          fontSize: 40.0, fontFamily: "Source Sans Pro"),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                  ),
                  SimpleButton(
                    content: 'Sign Up',
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => signup()),
                      );
                    },
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                  ),
                  SimpleButton(
                    content: 'LogIn',
                    onPress: () {
                      Navigator.pushNamed(
                        context,
                        signin.id,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
