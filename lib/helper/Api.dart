import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    try {
      http.Response response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            'Error: Status code ${response.statusCode}, Body: ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to GET data: $e');
    }
  }

  Future<dynamic> post({
    required String url,
    required dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    try {
      http.Response response =
          await http.post(Uri.parse(url), body: body, headers: headers);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            'Error: Status code ${response.statusCode}, Body: ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to POST data: $e');
    }
  }

  Future<dynamic> put({
    required String url,
    required dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    
    try {
      print('url =$url body =$body token=$token');
      http.Response response =
          await http.put(Uri.parse(url), body: body, headers: headers);
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        throw Exception(
            'Error: Status code ${response.statusCode}, Body: ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to PUT data: $e');
    }
  }
}
