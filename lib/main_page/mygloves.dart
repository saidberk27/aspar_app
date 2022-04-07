import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

class MyGloves extends StatefulWidget {
  MyGloves({Key? key}) : super(key: key);

  @override
  State<MyGloves> createState() => _MyGlovesState();
}

class _MyGlovesState extends State<MyGloves> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
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
        // Use SliverAppBar in header to make it sticky
        header: const SliverToBoxAdapter(child: Text('HEADER')),
        footer: const SliverToBoxAdapter(child: Text('FOOTER')),
        // item builder type is compulsory.
        itemBuilderType:
            PaginateBuilderType.listView, //Change types accordingly
        itemBuilder: (context, documentSnapshots, index) {
          final data = documentSnapshots[index].data() as Map?;
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: data == null ? const Text('Error in data') : Text("Deneme"),
            subtitle: Text(documentSnapshots[index].id),
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
