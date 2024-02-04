import 'package:shopping/models/cart_model.dart';
import 'package:shopping/network_setting.dart';
import 'package:dio/dio.dart';

class CartServices {
  static final dio = Dio();

  static Future<List<Product>> getCartData() async {
    final response = await dio.get("${NetworkSettings.baseUrl}carts/1");
    var data = response.data;
    CartModel cartproducts = CartModel.fromJson(data);

    return cartproducts.products ?? [];
  }
}
