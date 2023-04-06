import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:convert';

class TestApp extends StatelessWidget {
  const TestApp({super.key});
  void getAll() async {
    try {
      const uri='http://localhost:3001/api/contacts/';
      final url = Uri.parse(uri);
      final response = await http.get(url);
      final result = json.decode(response.body) as Map<String, dynamic>;
      result.forEach((key, value) {
        print(value);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    getAll();
    return const Text("thienthanh");
  }
}
