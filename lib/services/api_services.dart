import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServices {
  static String baseUrl = 'https://three-api.herokuapp.com/api/v1';

  Map<String, String> headers = {'Content-Type': 'application/json'};

  Future<dynamic> signUp({
    @required String fullName,
    @required String email,
    @required String password,
    // @required String confirmPassword,
    @required String phone,
  }) async {
    Map<String, String> data = {
      'fullName': fullName,
      'email': email,
      'password': password,
      'phone': phone,
      'pushToken': '0',
      'deviceId': '0'
    };

    var body = json.encode(data);
    var suc;
    String payloadEmail;
    String payloadPhone;
    String payloadPassword;
    String payloadFullName;

    String success = await http
        .post('$baseUrl/signup', body: body, headers: headers)
        .then((response) {
      String mess = jsonDecode(response.body)['message'];
      suc = jsonDecode(response.body)['success'];
      payloadEmail = jsonDecode(response.body)['payload']['email'];
      payloadPhone = jsonDecode(response.body)['payload']['phone'];
      payloadPassword = jsonDecode(response.body)['payload']['password'];
      payloadFullName = jsonDecode(response.body)['payload']['fullName'];
      print(response.body);
      print('The user creation is: $mess');
      return mess;
    }).catchError((err) {
      print(err.toString());
      return err.toString();
    });
    print(success);
    print(suc);

    if (suc) {
      return suc;
    } else if (success.contains('Email already in use')) {
      return success;
    } else if (success.contains('Validation Error') && payloadEmail != null) {
      return payloadEmail;
    } else if (success.contains('Validation Error') && payloadPhone != null) {
      return payloadPhone;
    } else if (success.contains('Validation Error') &&
        payloadPassword != null) {
      return payloadPassword;
    } else if (success.contains('Validation Error') &&
        payloadFullName != null) {
      return payloadFullName;
    } else {
      return success;
    }
  }

  Future<dynamic> login({
    @required String email,
    @required String password,
  }) async {
    Map<String, String> data = {
      'email': email,
      'password': password,
    };

    var body = json.encode(data);
    var suc;
    String payloadEmail;
    String payloadPassword;

    String success = await http
        .post('$baseUrl/login', body: body, headers: headers)
        .then((response) {
      String mess = jsonDecode(response.body)['message'];
      suc = jsonDecode(response.body)['success'];
      payloadEmail = jsonDecode(response.body)['payload']['email'];
      payloadPassword = jsonDecode(response.body)['payload']['password'];

      print(response.body);
      print('The user creation is: $mess');
      return mess;
    }).catchError((err) {
      print(err.toString());
      return err.toString();
    });
    print(success);
    print(suc);

    if (suc) {
      return suc;
    } else if (success.contains('Validation Error') && payloadEmail != null) {
      return payloadEmail;
    } else if (success.contains('Validation Error') &&
        payloadPassword != null) {
      return payloadPassword;
    } else {
      return success;
    }
  }
}
