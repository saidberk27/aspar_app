import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:aspar_main/local_functions/expirationcalculator.dart';

class GloveDatabase extends StatefulWidget {
  AsyncSnapshot? snapshot;
  GloveDatabase(this.snapshot, {Key? key}) : super(key: key);

  @override
  State<GloveDatabase> createState() => _GloveDatabaseState();

  void saveGlove() {
    debugPrint("Glove Saved");
  }
}

class _GloveDatabaseState extends State<GloveDatabase> {
  String expirationDate = "Error";
  MaterialColor statusCircleColor = Colors.grey;
  String statusText = "Error";

  @override
  Widget build(BuildContext context) {
    return PaginateFirestore(
      shrinkWrap: true,

      itemBuilderType: PaginateBuilderType.listView, //Change types accordingly
      itemBuilder: (context, documentSnapshots, index) {
        final data = documentSnapshots[index].data() as Map?;
        return Container(
          decoration: BoxDecoration(
              border: Border(
            top: BorderSide(width: 1.0, color: Color(0xFF0FA9EA)),
            bottom: BorderSide(width: 1.0, color: Color(0xFF0FA9EA)),
          )),
          child: ExpansionTile(
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
          ),
        );
      },
      // orderBy is compulsory to enable pagination
      query: FirebaseFirestore.instance
          .collection("test")
          .doc(widget.snapshot!
              .data) //snapshot.data userdata'dan gelen email bilgisine esit.
          .collection("class 0"),
      // to fetch real-time data
      isLive: true,
    );
  }
}
