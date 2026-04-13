import 'package:flutter/material.dart';
import 'package:market_ecommerceapp/core/widgets/custom_product_card.dart';

import 'favorites_data.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final favorites = FavoritesData.favorites;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        centerTitle: true,
      ),
      body: favorites.isEmpty
          ? const Center(
        child: Text("No favorite products yet ❤️"),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: favorites.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final item = favorites[index];

          return ProductCardAsset(
            imagePath: item["image"],
            name: item["title"],
            price: (item["price"] as num).toDouble(),
            rating: (item["rating"] as num).toDouble(),

            isFavorite: true,

            onFavoriteTap: () {
              setState(() {
                FavoritesData.toggleFavorite(item);
              });
            },
          );
        },
      ),
    );
  }
}