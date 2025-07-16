import 'dart:convert';

import 'package:api/Models/User_Model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Hometwo extends StatefulWidget {
  const Hometwo({super.key});

  @override
  State<Hometwo> createState() => _HometwoState();
}

class _HometwoState extends State<Hometwo> {
  Future<List<User_Model>> getuser() async {
    List<User_Model> allposts = [];
    var url = Uri.https("jsonplaceholder.typicode.com", "/users");

    var responce = await http.get(url);
    var responcebody = jsonDecode(responce.body);
    for (var i in responcebody) {
      allposts.add(User_Model.fromJson(i));
    }
    return allposts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getuser(),
        builder:
            ((BuildContext context, AsyncSnapshot<List<User_Model>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].name!),
                  subtitle:
                      Text(snapshot.data![index].address?.zipcode ?? "no data"),
                );
              },
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
