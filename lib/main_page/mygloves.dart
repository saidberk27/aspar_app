import 'package:flutter/material.dart';

class MyGloves extends StatelessWidget {
  const MyGloves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5000,
        itemBuilder: (context, index) {
          int indexNoShift = index + 1;
          return ExpansionTile(
            title: Text("Glove " + indexNoShift.toString()),
            leading: Icon(Icons.add),
            children: [
              Container(
                color: Color(0xFF0FA9EA),
                height: 300,
                width: 500,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "Glove" + indexNoShift.toString(),
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
                          Text(
                            "Serial Number:    ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                          Text(
                            indexNoShift.toString(),
                            style: TextStyle(
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
                          Text(
                            "Status:    ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Active",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Icon(
                              Icons.circle,
                              color: Colors.green.shade800,
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
                            "6 Months",
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
        });
  }
}
