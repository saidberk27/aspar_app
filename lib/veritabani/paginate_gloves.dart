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
                : Text(
                    documentSnapshots[index].id,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
            leading: const Icon(
              Icons.arrow_drop_down_circle_outlined,
              size: 36,
            ),
            trailing: Image.asset("assets/images/gloves.png"),
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
                height: 300,
                width: 500,
                color: Colors.white,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text(
                        "Safeline Dielectric Gloves",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: const Color(0xFF0FA9EA)),
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
                                fontSize: 24,
                                color: const Color(0xFF0FA9EA)),
                          ),
                          Text(
                            "${data!['Seri No']}",
                            style: const TextStyle(
                              fontSize: 21,
                              color: const Color(0xFF0FA9EA),
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
                            "Status:   ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: const Color(0xFF0FA9EA),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              statusText,
                              style: const TextStyle(
                                fontSize: 21,
                                color: const Color(0xFF0FA9EA),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 12.0),
                            child: Icon(
                              Icons.circle,
                              color: statusCircleColor,
                              size: 36,
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
                                fontSize: 24,
                                color: const Color(0xFF0FA9EA)),
                          ),
                          Text(
                            expirationDate,
                            style: const TextStyle(
                              fontSize: 21,
                              color: const Color(0xFF0FA9EA),
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
