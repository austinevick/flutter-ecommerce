import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/screen/widget/custom_text.dart';
import 'package:flutter/material.dart';

import '../../model/products_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductsModel model;
  const ProductDetailScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(model.title!, fontSize: 16),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CachedNetworkImage(
                  imageUrl: model.images!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const SizedBox.shrink(),
                  errorWidget: (context, url, error) => const SizedBox.shrink(),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  "\$${model.price}",
                  fontSize: 28,
                  paddingTop: 16,
                ),
              ),
              CustomText(
                model.description!,
                fontSize: 16,
                paddingTop: 16,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
