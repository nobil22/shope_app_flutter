import 'package:shop_app/helper/Api.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CatecogeryService {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoryName}) async {
    {
      List<dynamic> data = await Api()
          .get(url: 'https://fakestoreapi.com/products/category/$categoryName');
      List<ProductModel> productsList = [];
      for (int i = 0; i < data.length; i++) {
        productsList.add(
          ProductModel.fromjson(data[i]),
        );
      }
      return productsList;
    }
  }
}
