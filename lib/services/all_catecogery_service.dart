import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/helper/Api.dart';

class AllCatecogeryService {
  Future<List<dynamic>> getAllCategories() async {
   
  List<dynamic> data = await Api().get(url:'https://fakestoreapi.com/products/categories');
  return data;

  }
}
