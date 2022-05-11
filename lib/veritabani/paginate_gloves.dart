import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:aspar_main/local_functions/expirationcalculator.dart';
import 'package:aspar_main/local_functions/split_data.dart';

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
                    documentSnapshots[index].id, //  ASP-Eİ YA DA ASP-EİS OLACAK
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
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text(
                        "Safeline Elektriksel Yalıtımlı Kauçuk Eldiven",
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
                            "Seri Numarası:    ",
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
                            "Sınıf Numarası:    ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: const Color(0xFF0FA9EA)),
                          ),
                          Text(
                            "CLASS 00",
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
                            "Durum:   ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: const Color(0xFF0FA9EA),
                            ),
                          ),
                          Text(
                            statusText,
                            style: const TextStyle(
                              fontSize: 21,
                              color: const Color(0xFF0FA9EA),
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.circle,
                            color: statusCircleColor,
                            size: 36,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 16.0),
                      child: Row(
                        children: [
                          const Text(
                            "Eklenme Tarihi:    ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: const Color(0xFF0FA9EA)),
                          ),
                          Text(
                            _formatDate(data['Uygulamaya Eklenme Tarihi']),
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
                            "Son Test Tarihi:    ",
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

  String _formatDate(String date) {
    // date = 2022-05-10 13:12:19.038
    List splittedDate =
        date.split(" ")[0].split("-"); // splittedDate = [2022,05,10]
    String formattedDate =
        "${splittedDate[2]}/${splittedDate[1]}/${splittedDate[0]}"; //formattedDate = 10/05/2022

    return formattedDate;
  }
}
