import 'dart:convert';

import 'package:api/Models/Comments_Model.dart';
import 'package:http/http.dart' as http;

class Comments_Services {
  Future<List<comments_Model>> getComments() async {
    List<comments_Model> allComments = [];
    var url = Uri.https("jsonplaceholder.typicode.com", "/photos");
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    for (var i in responseBody) {
      allComments.add(comments_Model.fromJson(i));
    }
    return allComments;
  }
}
