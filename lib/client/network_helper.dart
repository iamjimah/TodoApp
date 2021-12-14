import 'dart:convert';
import 'dart:async';

import 'package:todo/Data/TodoData.dart';

import 'package:http/http.dart' as http;

class NetworkHelper {
  String baseUrl = "https://todojeemz.herokuapp.com/";

  Future<TodoData> getTodoData({String endpoint = ''}) async {
    try {
      final response = await http.get(Uri.parse(baseUrl + endpoint));
      if (response.statusCode == 200) {
        return TodoData.fromJSON(json.decode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<TodoData> postTodoData(
      {String endpoint = "",
      required String title,
      required String description,
      bool? status,
      required String date_time}) async {
    try {
      final response = await http.post(Uri.parse(baseUrl + endpoint), body: {
        "title": title,
        "description": description,
        "status": status ?? false,
        "date_time": date_time
      });
      if (response.statusCode == 200) {
        return TodoData.fromJSON(json.decode(response.body));
      } else {
        throw Exception('Failed to create data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<TodoData> updateTodoData(
      {String endpoint = "",
      required String id,
      required String title,
      required String description,
      bool? status,
      required String date_time}) async {
    try {
      final response =
          await http.post(Uri.parse(baseUrl + endpoint + id), headers: {
        "Content-Type": "application/json"
      }, body: {
        "title": title,
        "description": description,
        "status": status ?? false,
        "date_time": date_time
      });
      if (response.statusCode == 200) {
        return TodoData.fromJSON(json.decode(response.body));
      } else {
        throw Exception('Failed to update data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<TodoData> deleteTodoData({required String id}) async {
    try {
      final response = await http.delete(Uri.parse(baseUrl + id),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        return TodoData.fromJSON(json.decode(response.body));
      } else {
        throw Exception('Failed to delete data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
