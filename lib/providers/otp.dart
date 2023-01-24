import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/http_exception.dart';
import './auth.dart';

class Otp with ChangeNotifier {
  int id;

  Future<void> otp_verification(String otp) async {
    final url = 'https://ultimateapi.hostprohub.com/api/otp-verification/${id}';
    print(url);
    try {
      final response = await http.post(Uri.parse(url), body: {
        'otp': otp,
      });
      final responseData = json.decode(response.body);
      print(responseData);

      if (responseData["success"] != null) {
        notifyListeners();
      }
    }
    catch (error) {
      throw error;
    }
  }
}
