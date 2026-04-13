import 'package:flutter/material.dart';
import '../../../core/widgets/bottom_navigation_bar.dart';
import '../../../core/widgets/category_card.dart';
import '../../../core/widgets/custom_product_card.dart';
import '../../favourites/favorites_data.dart';
import '/core/dummy_data/data_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  bool isSearching = false;
  List<Map<String, dynamic>> allItems = [];
  List<Map<String, dynamic>> filteredItems = [];
  List<String> recentSearches = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    allItems = [
      ...HomeMockData.popularProducts,
      ...HomeMockData.bestForYou,
      ...HomeMockData.buyAgain,
    ];
    filteredItems = allItems;
  }

  void search(String query) {
    final results = allItems.where((item) {
      final title = item["title"].toString().toLowerCase();
      return title.contains(query.toLowerCase());
    }).toList();
    setState(() {
      filteredItems = results;
    });
  }

  void addRecentSearch(String query) {
    if (query.isEmpty) return;
    recentSearches.remove(query);
    recentSearches.insert(0, query);
    if (recentSearches.length > 5) {
      recentSearches.removeLast();
    }
    setState(() {});
  }

  Widget searchView() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: searchController,
            onChanged: search,
            onSubmitted: addRecentSearch,
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Search...",
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    isSearching = false;
                    searchController.clear();
                    filteredItems = allItems;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        if (searchController.text.isEmpty) ...[
          if (recentSearches.isNotEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recent Searches",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          Wrap(
            children: recentSearches.map((e) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: ActionChip(
                  label: Text(e),
                  onPressed: () {
                    searchController.text = e;
                    search(e);
                  },
                ),
              );
            }).toList(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Suggestions",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: HomeMockData.categories.length,
              itemBuilder: (context, index) {
                final item = HomeMockData.categories[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: CategoryCard(
                    imageUrl: item["image"] as String,
                    title: item["name"] as String,
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: HomeMockData.brands.length,
              itemBuilder: (context, index) {
                final item = HomeMockData.brands[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: CategoryCard(
                    imageUrl: item["image"] as String,
                    title: item["name"] as String,
                  ),
                );
              },
            ),
          ),
        ] else
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return ListTile(
                  leading: Image.network(item["image"] as String, width: 50),
                  title: Text(item["title"] as String),
                  subtitle: Text("${item["price"]} EGP"),
                  onTap: () {
                    addRecentSearch(item["title"] as String);
                  },
                );
              },
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: isSearching
            ? searchView()
            : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 22,
                      backgroundImage: NetworkImage(
                        "https://i.pravatar.cc/150?img=3",
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Hi Yousef !",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(Icons.notifications_none),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: searchController,
                  onTap: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "What are you looking for ?",
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.tune),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/Scrolled_Offer.png',
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              sectionTitle("Popular Product"),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: HomeMockData.popularProducts.length,
                  itemBuilder: (context, index) {
                    final item = HomeMockData.popularProducts[index];

                    return Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: ProductCardAsset(
                        imagePath: item["image"] as String,
                        name: item["title"] as String,
                        price: (item["price"] as num).toDouble(),
                        rating: (item["rating"] as num).toDouble(),

                        isFavorite: FavoritesData.isFavorite(item),

                        onFavoriteTap: () {
                          setState(() {
                            FavoritesData.toggleFavorite(item);
                          });
                        },
                      ),
                    );
                  },
                ),
              ),

              sectionTitle("Category"),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: HomeMockData.categories.length,
                  itemBuilder: (context, index) {
                    final item = HomeMockData.categories[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: CategoryCard(
                        imageUrl: item["image"] as String,
                        title: item["name"] as String,
                      ),
                    );
                  },
                ),
              ),

              sectionTitle("Best for You"),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: HomeMockData.bestForYou.length,
                  itemBuilder: (context, index) {
                    final item = HomeMockData.bestForYou[index];

                    return Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: ProductCardAsset(
                        imagePath: item["image"] as String,
                        name: item["title"] as String,
                        price: (item["price"] as num).toDouble(),
                        rating: (item["rating"] as num).toDouble(),

                        isFavorite: FavoritesData.isFavorite(item),

                        onFavoriteTap: () {
                          setState(() {
                            FavoritesData.toggleFavorite(item);
                          });
                        },
                      ),
                    );
                  },
                ),
              ),

              sectionTitle("Brands"),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: HomeMockData.brands.length,
                  itemBuilder: (context, index) {
                    final item = HomeMockData.brands[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: CategoryCard(
                        imageUrl: item["image"] as String,
                        title: item["name"] as String,
                      ),
                    );
                  },
                ),
              ),

              sectionTitle("Buy Again"),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: HomeMockData.buyAgain.length,
                  itemBuilder: (context, index) {
                    final item = HomeMockData.buyAgain[index];

                    return Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: ProductCardAsset(
                        imagePath: item["image"] as String,
                        name: item["title"] as String,
                        price: (item["price"] as num).toDouble(),
                        rating: (item["rating"] as num).toDouble(),

                        isFavorite: FavoritesData.isFavorite(item),

                        onFavoriteTap: () {
                          setState(() {
                            FavoritesData.toggleFavorite(item);
                          });
                        },
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Text("View all", style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
}