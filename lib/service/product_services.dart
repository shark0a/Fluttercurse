import 'package:shopping/models/product_model.dart';
import 'package:shopping/network_setting.dart';
import 'package:dio/dio.dart';

class ProductsService {
  static final dio = Dio();

  static Future<List<Product>> getProductsData() async {
    final response = await dio.get("${NetworkSettings.baseUrl}products");
    var data = response.data;
    ProductsModel productsModel = ProductsModel.fromJson(data);

    return productsModel.products ?? [];
  }
}
