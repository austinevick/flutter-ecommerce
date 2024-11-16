import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/common/navigators.dart';
import 'package:e_commerce_app/screen/detail/product_detail_screen.dart';
import 'package:e_commerce_app/screen/home/home_view_model.dart';
import 'package:e_commerce_app/screen/profile/profile_screen.dart';
import 'package:e_commerce_app/screen/widget/custom_button.dart';
import 'package:e_commerce_app/screen/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsProvider =
    FutureProvider((ref) => ref.read(homeViewModel).getProducts());

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          actions: [
            IconButton(
                onPressed: () => push(const ProfileScreen()),
                icon: const Icon(Icons.person_outline))
          ],
        ),
        body: ref.watch(productsProvider).when(
            data: (data) => ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, i) {
                    final p = data[i];
                    return GestureDetector(
                      onTap: () => push(ProductDetailScreen(model: p)),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 16),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            p.images == null
                                ? const SizedBox.shrink()
                                : CachedNetworkImage(
                                    imageUrl: p.images!,
                                    fit: BoxFit.cover,
                                    height: 200,
                                    placeholder: (context, url) =>
                                        const SizedBox.shrink(),
                                    errorWidget: (context, url, error) =>
                                        const SizedBox.shrink(),
                                  ),
                            CustomText(
                              p.title!,
                              paddingTop: 8,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                    height: 35,
                                    width: 100,
                                    color: Colors.red,
                                    child: CustomText("\$${p.price}",
                                        color: Colors.white)),
                                IconButton(
                                    color: p.isFavourite
                                        ? Colors.red
                                        : Colors.black,
                                    onPressed: () => setState(
                                        () => p.isFavourite = !p.isFavourite),
                                    icon: Icon(!p.isFavourite
                                        ? Icons.favorite_border
                                        : Icons.favorite))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
            error: (e, t) => Center(child: Text(e.toString())),
            loading: () => const Center(
                  child: CircularProgressIndicator.adaptive(),
                )),
      );
    });
  }
}
