import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataFetchPage extends StatelessWidget {
  const DataFetchPage({super.key});

  Future<void> fetchData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Title: ${data['title']}');
      } else {
        throw Exception('Failed to load data (Status: ${response.statusCode})');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Fetch Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: fetchData,
          child: const Text('Fetch Data'),
        ),
      ),
    );
  }
}
