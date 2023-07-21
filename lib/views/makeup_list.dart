import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MakeupList extends StatefulWidget {
  const MakeupList({super.key});

  @override
  State<MakeupList> createState() => _MakeupListState();
}

class _MakeupListState extends State<MakeupList> {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference makeupDoc =FirebaseFirestore.instance.collection('makeup');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<QuerySnapshot<Object?>>(
          future: makeupDoc.get(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData == false && snapshot.data == null) {
              return Text("Document does not exist");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              // Map<String, dynamic> data =
              //     snapshot.data!.docs as Map<String, dynamic>;
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(
                        "full name: ${snapshot.data!.docs[index]['name']}  ${snapshot.data!.docs[index]['price']}");
                  });
            }

            return Text("loading");
          },
        ));
  }
}
