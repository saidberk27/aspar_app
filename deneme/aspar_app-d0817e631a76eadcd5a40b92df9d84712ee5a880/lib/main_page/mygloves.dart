import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:aspar_main/local_functions/expirationcalculator.dart';
import 'package:aspar_main/local_functions/userdata.dart';
import 'package:aspar_main/main_page/add_new_glove.dart';

class MyGloves extends StatefulWidget {
  MyGloves({Key? key}) : super(key: key);

  @override
  State<MyGloves> createState() => _MyGlovesState();
}

class _MyGlovesState extends State<MyGloves> {
  String expirationDate = "Error";
  MaterialColor statusCircleColor = Colors.grey;
  String statusText = "Error";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: UserData.getEmail,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            //snapshot.data userdata'dan gelen email bilgisine esit.
            return Scaffold(
              body: PaginateGloves(snapshot),
              floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (newsContext) => AddNewGlove()));
                  },
                  label: Row(
                    children: [
                      Text(
                        "Tap to Add New Glove\t",
                        style: TextStyle(fontSize: 18),
                      ),
                      Icon(
                        Icons.add,
                        size: 24,
                      )
                    ],
                  )),
            );
          } else {
            return const Text(
                "Something Went Wrong"); // ilk null sonra veri geliyor. henuz cozemedim.
          }
        },
      ),
    );
  }

  PaginateFirestore PaginateGloves(AsyncSnapshot<dynamic> snapshot) {
    return PaginateFirestore(
      itemBuilderType: PaginateBuilderType.listView, //Change types accordingly
      itemBuilder: (context, documentSnapshots, index) {
        final data = documentSnapshots[index].data() as Map?;
        return ExpansionTile(
          maintainState: true,
          title: data == null
              ? const Text('Error in data')
              : Text(documentSnapshots[index].id),
          leading: const Icon(Icons.add),
          subtitle: Text(documentSnapshots[index].id),
          onExpansionChanged: (bool expansionStatus) {
            Expiration expiration = Expiration(data!["Basım Tarihi"]);

            setState(() {
              if (expansionStatus) {
                expirationDate = expiration.calculateExpiration();
                statusCircleColor = expiration.statusColor();
                statusText = expiration.statusString();
              }
            });
          },
          children: [
            Container(
              color: const Color(0xFF0FA9EA),
              height: 300,
              width: 500,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      "Safeline Dielectric Gloves",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 16.0),
                    child: Row(
                      children: [
                        const Text(
                          "Serial Number:    ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        Text(
                          "${data!['Seri No']}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 16.0),
                    child: Row(
                      children: [
                        const Text(
                          "Status:    ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            statusText,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.circle,
                            color: statusCircleColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 16.0),
                    child: Row(
                      children: [
                        const Text(
                          "Expiration:    ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        Text(
                          expirationDate,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
      // orderBy is compulsory to enable pagination
      query: FirebaseFirestore.instance
          .collection("test")
          .doc(snapshot
              .data) //snapshot.data userdata'dan gelen email bilgisine esit.
          .collection("class 0"),
      // to fetch real-time data
      isLive: false,
    );
  }
}
