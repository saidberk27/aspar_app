import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:aspar_main/local_functions/expirationcalculator.dart';

class MyGloves extends StatefulWidget {
  MyGloves({Key? key}) : super(key: key);

  @override
  State<MyGloves> createState() => _MyGlovesState();
}

class _MyGlovesState extends State<MyGloves> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String expirationDate = "Error";
  MaterialColor statusCircleColor = Colors.grey;
  String statusText = "Error";
  _getGloves() async {
    debugPrint("Get Gloves");
    var response = await _firestore
        .collection("Musteriler")
        .doc("1")
        .collection("ARC")
        .doc("CLASS 0")
        .get();

    return response.data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaginateFirestore(
        itemBuilderType:
            PaginateBuilderType.listView, //Change types accordingly
        itemBuilder: (context, documentSnapshots, index) {
          final data = documentSnapshots[index].data() as Map?;
          return ExpansionTile(
            maintainState: true,
            title: data == null ? const Text('Error in data') : Text("Deneme"),
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
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "Safeline Dielectric Gloves",
                        style: const TextStyle(
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
                              style: TextStyle(
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
                          Text(
                            "Expiration:    ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                          Text(
                            expirationDate,
                            style: TextStyle(
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
        query: FirebaseFirestore.instance.collection('app_test'),
        // to fetch real-time data
        isLive: true,
      ),
    );
  }
}
