import 'dart:convert';

import 'package:e_commerce_app/model/login_model.dart';
import 'package:e_commerce_app/model/products_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/api_endpoint.dart';
import '../api/http_client.dart';

final appRepository = Provider((_) => AppRepository());

class AppRepository {
  Future<LoginResponseModel> login(LoginModel model) async {
    final response =
        await HttpClient.postRequest(ApiEndpoint.login, body: model.toMap());
    final json = jsonDecode(response.body);
    return LoginResponseModel.fromJson(json, response.statusCode);
  }

  Future<List<ProductsModel>> getProducts() async {
    final response = await HttpClient.getRequest(ApiEndpoint.products);

    final json = jsonDecode(response.body) as List;
    return json.map((e) => ProductsModel.fromJson(e)).toList();
  }
}
