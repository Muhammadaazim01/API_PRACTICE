import 'package:api/Models/Albums_Model.dart';
import 'package:api/Services/Album_Services.dart';
import 'package:flutter/material.dart';

class HomeThree extends StatefulWidget {
  const HomeThree({super.key});

  @override
  State<HomeThree> createState() => _HomeThreeState();
}

class _HomeThreeState extends State<HomeThree> {
  late Future<List<Albums_Model>> albumsFuture;

  @override
  void initState() {
    super.initState();
    albumsFuture = Albums_Services().getAlhbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Albums Page"),
      ),
      body: FutureBuilder(
        future: albumsFuture,
        builder: ((BuildContext context,
            AsyncSnapshot<List<Albums_Model>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].title ?? "No Title"),
                  subtitle:
                      Text(snapshot.data![index].id?.toString() ?? "No ID"),
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
