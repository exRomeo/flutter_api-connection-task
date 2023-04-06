import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'response_model.dart';

class ProductsProvider extends ChangeNotifier {
  final String _baseUrl = "https://dummyjson.com/";
  final String _productsPath = "products";
  List<Product> products = [];
  List<Product> favorites = [];

  ProductsProvider() {
    fetchData();
  }

  void addToFavorites(Product product) {
    if (!favorites.contains(product)) {
      favorites.add(product);
      notifyListeners();
    }
  }

  void removeFromFavorites(Product product) {
    favorites.remove(product);
    notifyListeners();
  }

  fetchData() async {
    var url = Uri.parse('$_baseUrl$_productsPath');
    Response response = await http.get(url);
    Map<String, dynamic> body = jsonDecode(response.body);
    var resp = ProductModel.fromJson(body);
    for (var prod in resp.products!) {
      products.add(prod);
    }
    notifyListeners();
  }
}
