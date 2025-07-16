import 'dart:convert';

import 'package:api/Models/Albums_Model.dart';
import 'package:http/http.dart' as http;

class Albums_Services {
  Future<List<Albums_Model>> getAlhbums() async {
    List<Albums_Model> allalbums = [];
    var url = Uri.https("jsonplaceholder.typicode.com", "/albums");
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    for (var i in responseBody) {
      allalbums.add(Albums_Model.fromJson(i));
    }
    return allalbums;
  }
}
