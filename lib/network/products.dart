import 'package:dio/dio.dart';
import 'package:journey/network/apis.dart';
import 'package:journey/generated/json/base/json_convert_content.dart';
import 'package:journey/models/Product_List_entity.dart';

class Products {
  static Future<List<ProductListEntity>> getProductList() {
    return Apis.get(
      'v1/products',
      params: null,
    ).then((value) {
      if (value.statusCode != 200) {
        return Future.value([]);
      }
      var products =
          JsonConvert.fromJsonAsT<List<ProductListEntity>>(value.data);
      return Future.value(products);
    });
  }
}
