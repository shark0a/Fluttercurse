import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping/config/firebase_cloud_util.dart';

class CategorieScreen extends StatefulWidget {
  const CategorieScreen({super.key});

  @override
  State<CategorieScreen> createState() => _CategorieScreenState();
}

class _CategorieScreenState extends State<CategorieScreen> {
  final Stream<QuerySnapshot> categoryStream = FirebaseFirestore.instance
      .collection(FirebaseCloudStoreUtil.categoryCollectionName)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: categoryStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          return GridView.builder(
              itemCount: snapshot.data!.docs.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                Map<String, dynamic> data =
                    snapshot.data!.docs[index].data()! as Map<String, dynamic>;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 70,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.cyanAccent,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          data["photo_url"] ?? "--",
                          width: 50,
                          height: 80,
                        ),
                        Text(data["name"] ?? "--"),
                        Text("desc: ${data["desc"]}"),
                        Text("itemNO:${data["item_no"]}"),
                        IconButton(
                            onPressed: () {
                              FirebaseCloudStoreUtil.deleteCategory(
                                  snapshot.data!.docs[index].id);
                            },
                            icon: Icon(Icons.delete))
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
