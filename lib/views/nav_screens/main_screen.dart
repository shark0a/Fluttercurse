import 'package:flutter/material.dart';
import 'package:task/models/product_model.dart';
import 'package:task/service/product_services.dart';
import 'package:task/views/details_page.dart';
import 'package:task/widgets/card_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Product> productlist = [];
  bool isLoading = true;

  Future<void> getData() async {
    productlist = await ProductsService.getProductsData();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: productlist.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(
                          product: productlist[index],
                        ),
                      ));
                },
                child: ItemCard(
                    productName: productlist[index].title ?? "--",
                    price: "${productlist[index].price}",
                    thumbnail: productlist[index].thumbnail ?? ""),
              );
            },
          );
  }
}
