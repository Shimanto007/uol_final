import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../models/http_exception.dart';
import '../cart/cart_screen.dart';

enum AuthMode { Signup, Login }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    // final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
    // transformConfig.translate(-10.0);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: NetworkImage(
                        'https://ultimateapi.hostprohub.com/admin/images/logo.png'),
                    width: 200,
                    height: 200,
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                      // ..translate(-10.0),
                      child: Text(
                        'Ultimate Organic Life',
                        style: TextStyle(
                          color: Color(0xFF0098B8),
                          fontSize: 28,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // flex: deviceSize.width > 600 ? 2 : 1,
                    child: AuthCard(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();
  

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An error occured'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('Okay'),
          )
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (_authMode == AuthMode.Login) {
        // Log user in
        await Provider.of<Auth>(context, listen: false).login(
          _authData['customer_email'],
          _authData['customer_password'],
        );
      } else {
        // Sign user up
        await Provider.of<Auth>(context, listen: false).signup(
          _authData['customer_name'],
          _authData['customer_email'],
          _authData['customer_password'],
          _authData['customer_contact'],
          _authData['customer_gender'],
          _authData['customer_dob'],
        );
      }
      Navigator.of(context).pushNamed(
        '/reg_otp',
        // arguments: {"id": id},
      );
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      print(error.toString());
      if (error.toString().contains('customer_email') && error.toString().contains('customer_contact')) {
        errorMessage = 'This Email & Contact is already in use';
      }
      else if (error.toString().contains('Email already exists')) {
        errorMessage = 'this email address is already in use';
      }
      else if (error.toString().contains('The customer contact has already been taken.')) {
        errorMessage = 'this contact address is already in use';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage = 'Could not authenticate. Please try again later';
      _showErrorDialog(errorMessage);
      // print(error);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int _value = 0;
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      height: _authMode == AuthMode.Signup ? 600 : 260,
      constraints:
          BoxConstraints(minHeight: _authMode == AuthMode.Signup ? 600 : 260),
      width: deviceSize.width * 0.85,
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              if (_authMode == AuthMode.Signup)
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Your Name',
                    suffixStyle: TextStyle(
                      fontFamily: 'Lato',
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  onSaved: (value) {
                    _authData['customer_name'] = value;
                  },
                ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'E-Mail',
                  suffixStyle: TextStyle(
                    fontFamily: 'Lato',
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                // validator: (value) {
                //   if (value.isEmpty ||
                //       !value.contains('@') && !value.contains('.')) {
                //     return 'Invalid email!';
                //   }
                //   return null;
                // },
                onSaved: (value) {
                  _authData['customer_email'] = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixStyle: TextStyle(
                    fontFamily: 'Lato',
                  ),
                ),
                obscureText: true,
                controller: _passwordController,
                // validator: (value) {
                //   if (value.isEmpty || value.length < 1) {
                //     return 'Password is too short!';
                //   }
                // },
                onSaved: (value) {
                  _authData['customer_password'] = value;
                },
              ),
              if (_authMode == AuthMode.Signup)
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Contact Number',
                    suffixStyle: TextStyle(
                      fontFamily: 'Lato',
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  onSaved: (value) {
                    _authData['customer_contact'] = value;
                  },
                ),
              if (_authMode == AuthMode.Signup)
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    suffixStyle: TextStyle(
                      fontFamily: 'Lato',
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  onSaved: (value) {
                    _authData['customer_gender'] = value;
                  },
                ),
              if (_authMode == AuthMode.Signup)
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Your Birthdate',
                    suffixStyle: TextStyle(
                      fontFamily: 'Lato',
                    ),
                  ),
                  keyboardType: TextInputType.datetime,
                  onSaved: (value) {
                    _authData['customer_dob'] = value;
                  },
                ),

              if (_authMode == AuthMode.Signup)
                TextFormField(
                  enabled: _authMode == AuthMode.Signup,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    suffixStyle: TextStyle(
                      fontFamily: 'Lato',
                    ),
                  ),
                  obscureText: true,
                  validator: _authMode == AuthMode.Signup
                      ? (value) {
                          if (value != _passwordController.text) {
                            return 'Passwords do not match!';
                          }
                        }
                      : null,
                ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: <Widget>[
              //     Column(
              //       children: [
              //         Radio(
              //           value: 1,
              //           groupValue: _value,
              //           onChanged: (value) {
              //             setState(() {
              //               _value = value;
              //             });
              //           },
              //         ),
              //         SizedBox(
              //           width: 10.0,
              //         ),
              //         Text("Male")
              //       ],
              //     ),
              //     Column(
              //       children: [
              //         Radio(
              //           value: 2,
              //           groupValue: _value,
              //           onChanged: (value) {
              //             setState(() {
              //               _value = value;
              //             });
              //           },
              //         ),
              //         SizedBox(
              //           width: 10.0,
              //         ),
              //         Text("Female")
              //       ],
              //     ),
              //     Column(
              //       children: [
              //         Radio(
              //           value: 3,
              //           groupValue: _value,
              //           onChanged: (value) {
              //             setState(() {
              //               _value = value;
              //             });
              //           },
              //         ),
              //         SizedBox(
              //           width: 10.0,
              //         ),
              //         Text("Others")
              //       ],
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 20,
              ),
              if (_isLoading)
                CircularProgressIndicator()
              else
                ElevatedButton(
                  child: Text(
                    _authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: _submit,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF0098B8)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    // padding: EdgeInsets.all(10.0),
                  ),
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(30),
                  // ),
                  // padding:
                  //     EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                  // color: Theme.of(context).primaryColor,
                  // textColor: Theme.of(context).primaryTextTheme.button.color,
                ),
              TextButton(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                  child: Text(
                    '${_authMode == AuthMode.Login ? 'SIGNUP' : 'LOGIN'} INSTEAD',
                    style: TextStyle(
                      color: Color(0xFF0098B8),
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
                onPressed: _switchAuthMode,
                // padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                // Color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
