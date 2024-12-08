import 'dart:convert';

import 'package:shop_app/helper/Api.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class GetProdutService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');
    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromjson(data[i]),
      );
    }
    return productsList;
  }
}
