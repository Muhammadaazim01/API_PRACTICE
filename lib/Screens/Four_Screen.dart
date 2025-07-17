import 'package:api/Models/Comments_Model.dart';
import 'package:api/Services/Comments_Services.dart';
import 'package:flutter/material.dart';

class Four_Screen extends StatefulWidget {
  const Four_Screen({super.key});

  @override
  State<Four_Screen> createState() => _Four_ScreenState();
}

class _Four_ScreenState extends State<Four_Screen> {
  late Future<List<comments_Model>> commentsFuture;

  @override
  void initState() {
    super.initState();
    commentsFuture = Comments_Services().getComments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("Four Screen"),
      ),
      body: FutureBuilder(
        future: commentsFuture,
        builder: (BuildContext context,
            AsyncSnapshot<List<comments_Model>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].title ?? "No Title"),
                  subtitle: Text(
                      snapshot.data![index].thumbnailUrl ?? "No Thumbnail"),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
