import 'dart:convert';

import 'package:api/Models/Post_Model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<List<Post_Model>> getPosts() async {
    List<Post_Model> allposts = [];
    var url = Uri.https("jsonplaceholder.typicode.com", "/posts");

    var responce = await http.get(url);
    var responcebody = jsonDecode(responce.body);
    for (var i in responcebody) {
      allposts.add(Post_Model.fromJson(i));
    }
    return allposts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getPosts(),
        builder:
            ((BuildContext context, AsyncSnapshot<List<Post_Model>> snapshot) {
          if (snapshot.hasData) {
            return ListTile(
              title: Text("${snapshot.data![0].id ?? "no id"}"),
              subtitle: Text(snapshot.data![0].body! ?? "no body"),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
