import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wastetastic/control/UserAccountMgr.dart';
import 'package:wastetastic/screens/MainScreen.dart';
import 'package:wastetastic/screens/SignInScreen.dart';
import 'package:wastetastic/widgets/SimpleButton.dart';

TextEditingController emailController = new TextEditingController();

final _formKey = GlobalKey<FormState>();
String newPassword;
String confirmPassword;

class ResetPasswordScreen extends StatefulWidget {
  static String id = 'Forgot_password_page';
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool _obscureConfirmText = true;
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    final String email = args['email'];
    final bool ForgotPassword = args['forgot_password'];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.green[700], Colors.lime[200]],
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60.0,
                      //backgroundImage: AssetImage('')
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                      AssetImage('assets/images/wastetastic_1.png'),
                    ),
                    SizedBox(height: 20),
                    Text('Reset Password',
                        style: TextStyle(
                            fontSize: 35.0, fontFamily: "Source Sans Pro")),
                        //style: TextStyle(color: Colors.white, fontSize: 18)),
                    SizedBox(height: 7.5),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 7.5, horizontal: 20),
                      child: TextFormField(
                        validator: (value) =>
                            value.isEmpty ? "Enter Password" : null,
                        onChanged: (value) {
                          newPassword = value;
                        },
                        cursorColor: Colors.teal[900],
                        maxLength: 30,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock, color: Colors.teal[900]),
                          labelText: 'New Password',
                          labelStyle: TextStyle(
                              color: Colors.teal[900], fontSize: 20,
                          ),
                          //helperText: 'Number of characters',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal[900]),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.teal[900]),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 7.5, horizontal: 20),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) return "Enter Password";
                          if (value != newPassword)
                            return "Passwords Dont Match";
                          return null;
                        },
                        onChanged: (value) {
                          confirmPassword = value;
                        },
                        cursorColor: Colors.teal[900],
                        maxLength: 30,
                        obscureText: _obscureConfirmText,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock, color: Colors.teal[900]),
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(
                            color: Colors.teal[900], fontSize: 20,
                          ),
                          //helperText: 'Number of characters',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal[900]),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                                _obscureConfirmText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.teal[900]),
                            onPressed: () {
                              setState(() {
                                _obscureConfirmText = !_obscureConfirmText;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SimpleButton(
                      content: 'Reset Password',
                      onPress: () {
                        UserAccountMgr.updateUserPassword(email, newPassword);
                        if (_formKey.currentState.validate()) {
                          showDialog(
                            context: context,
                            builder: (BuildContext dialogContext) {
                              return AlertDialog(
                                title: Center(child: Text('Password Changed')),
                                content: Text(
                                    'You have successfully changed your account Password!'),
                                actions: <Widget>[
                                  new FlatButton(
                                    onPressed: () {
                                      ForgotPassword
                                          ? Navigator.popUntil(
                                              context,
                                              ModalRoute.withName(
                                                  SignInScreen.id))
                                          : Navigator.popUntil(
                                              context,
                                              ModalRoute.withName(
                                                  MainScreen.id));
                                    },
                                    textColor: Colors.grey,
                                    child: const Text('Continue'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    )
  );
  }
}