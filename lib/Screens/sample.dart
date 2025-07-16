import 'package:api/Models/Albums_Model.dart';
import 'package:api/Services/Album_Services.dart';
import 'package:flutter/material.dart';

class Sample_User extends StatefulWidget {
  const Sample_User({super.key});

  @override
  State<Sample_User> createState() => _Sample_UserState();
}

class _Sample_UserState extends State<Sample_User> {
  late Future<List<Albums_Model>> albumspostsall;
  @override
  void initState() {
    super.initState();
    albumspostsall = Albums_Services().getAlhbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Sample User Page"),
      ),
      body: FutureBuilder(
          future: albumspostsall,
          builder: ((BuildContext context,
              AsyncSnapshot<List<Albums_Model>> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 5,
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(snapshot.data![index].id?.toString() ??
                                  "No ID"),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                snapshot.data![index].title ?? "No Title",
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          })),
    );
  }
}
