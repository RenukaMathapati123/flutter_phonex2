import 'dart:convert';

import 'package:flutter_phonex2/model/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  Future<List<Todo>> getAll() async {
    const url = 'http://techkit-server.com:5000/book/all';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e){
        return Todo(
          customerName: e['customerName'],
          email: e['email'],
          pickupAddress: e['pickupAddress'],
          
        );
      }).toList();
      return todos;
    }
    // throw "Something went wrong";
    return [];
  }
}