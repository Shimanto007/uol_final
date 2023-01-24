import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../models/http_exception.dart';
import '../cart/cart_screen.dart';
import '../providers/auth.dart';



class OtpScreen extends StatelessWidget {
  static const routeName = '/reg_otp';

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
                    child: OtpCard(),
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

class OtpCard extends StatefulWidget {

  @override
  _OtpCardState createState() => _OtpCardState();
}

class _OtpCardState extends State<OtpCard> {
  Map<String, String> _authData = {
    'otp': '',
  };
  var _isLoading = false;

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
    setState(() {
      _isLoading= true;
    });

    try {
        // Log user in
        await Provider.of<Auth>(context, listen: false).otp_verification(
          _authData['otp'],
        );
      Navigator.of(context).pushNamed(
        '/reg_otp',
      );
    } catch (err) {
      _showErrorDialog(err);
    }


}


  @override
  Widget build(BuildContext context) {
    int _value = 0;
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      height: 260,
      constraints:
          BoxConstraints(minHeight: 260),
      width: deviceSize.width * 0.85,
      padding: EdgeInsets.all(16.0),
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Verify OTP',
                    suffixStyle: TextStyle(
                      fontFamily: 'Lato',
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  onSaved: (value) {
                    _authData['otp'] = value;
                  },
                ),
              if (_isLoading)
                CircularProgressIndicator()
              else
                ElevatedButton(
                  child: Text(
                    'Verify Otp',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: _submit,
                  // onPressed: () {},
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
                ),
            ],
          ),
        ),
      ),
    );
  }
}
