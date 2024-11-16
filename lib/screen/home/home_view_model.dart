import 'package:e_commerce_app/repository/app_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/products_model.dart';

final homeViewModel = ChangeNotifierProvider((ref) => HomeViewModel(ref));

class HomeViewModel extends ChangeNotifier {
  final Ref _ref;

  HomeViewModel(this._ref);

  Future<List<ProductsModel>> getProducts() async =>
      _ref.read(appRepository).getProducts();
}
