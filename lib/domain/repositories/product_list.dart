import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:limerick_flutter_task/domain/model/product_list_models.dart';
import 'package:limerick_flutter_task/domain/repositories/api_url.dart';

class ProductListRepo {
  static Future<List<Products>> getProductList() async {
    try {
      Uri url = Uri.parse(ApiUrls.productListsUrl);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        ProductListModels data = ProductListModels.fromJson(jsonDecode(response.body));
        return data.products ?? [];
      }
    } catch (e) {
      log("Error : $e");
    }
    return [];
  }
}
