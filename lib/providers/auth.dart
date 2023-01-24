import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/http_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  String _id;
  String customer_reg_id;

  bool get isAuth {
    return _token != null;
  }

  String get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }
  String get id {
    if( _id != null) {
      return _id;
    }
  }

  Future<void> signup(
    String name,
    String email,
    String password,
    String contact_number,
    String gender,
    String birthdate,
  ) async {
    const urs = 'https://ultimateapi.hostprohub.com/api/register-customer';
    try {
      final response = await http.post(Uri.parse(urs), body: {
        'customer_name': name,
        'customer_email': email,
        'customer_password': password,
        'customer_contact': contact_number,
        'customer_gender': gender,
        'customer_dob': birthdate,
      });
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      print(localStorage);

      print(customer_reg_id);
      final responseData = json.decode(response.body);

      if (responseData["success_message"] == 'Registration Successful!'){
        // _id = (responseData["customer"]["id"]);
        // print(_id);
        notifyListeners();
      }
      if (responseData["success"] == false) {
        if (responseData["message"].toString().contains("customer_contact") &&
            responseData["message"].toString().contains("customer_email")) {
          throw HttpException(responseData["message"].toString());
        } else if (responseData["message"]
            .toString()
            .contains("customer_email")) {
          throw HttpException(
              responseData["message"]["customer_email"].toString());
        } else if (responseData["message"]
            .toString()
            .contains("customer_contact")) {
          throw HttpException(
              responseData["message"]["customer_contact"].toString());
        }
      }
      // print(responseData["customer"]["id"]);
      // customer_reg_id = responseData["customer"]["id"];
      // customer_reg_id = responseData["customer"]["id"];
      // print(customer_reg_id);

      print(responseData);
      notifyListeners();


    } catch (error) {
      throw error;
    }

  }

  Future<void> otp_verification(String otp) async {
    print(id);
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



  Future<void> login(String email, String customer_password) async {
    const url = 'https://ultimateapi.hostprohub.com/api/customer/login';
    try {
      final response = await http.post(Uri.parse(url), body: {
        'user_input': email,
        'password': customer_password,
      });
      final responseData = json.decode(response.body);
      print(responseData);

      if (responseData["token_id"] != null) {
        _token = responseData["token"];
        print(_token);
        notifyListeners();
      }
    } catch (error) {
      throw error;
    }
  }




}
