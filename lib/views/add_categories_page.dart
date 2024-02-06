import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shopping/config/firebase_cloud_util.dart';
import 'package:shopping/models/category_model.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({Key? key}) : super(key: key);

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController photoUrlController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController itemCountController = TextEditingController();
  final _addCategoryFormKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new category"),
      ),
      body: Form(
        key: _addCategoryFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: "Name",
                    ),
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return "Invalid name";
                      }
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: itemCountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "item Count",
                    ),
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return "Invalid number";
                      }
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: descController,
                    decoration: const InputDecoration(
                      labelText: "Description",
                    ),
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return "Invalid Description";
                      }
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: photoUrlController,
                    decoration: const InputDecoration(
                      labelText: "Image Url",
                    ),
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return "Invalid URL";
                      }
                    },
                  )),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : AppButton(
                      text: "Add Category",
                      color: Colors.blue,
                      onTap: () async {
                        if (_addCategoryFormKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          var data = CategoryModel(
                              name: nameController.text,
                              desc: descController.text,
                              image: photoUrlController.text,
                              itemNo: itemCountController.text);
                          bool result =
                              await FirebaseCloudStoreUtil.addNewCategory(data);
                          if (result) {
                            nameController.clear();
                            descController.clear();
                            photoUrlController.clear();
                            itemCountController.clear();
                            var snackBar = const SnackBar(
                              content: Text("Category is Added :D"),
                            );
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            var snackBar = const SnackBar(
                              content: Text("Something went wrong!!"),
                            );
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                        isLoading = false;
                        setState(() {});
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
