import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/articles_provider.dart';
import 'details_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductsProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Favorites"),
        ),
        body: provider.favorites.isEmpty
            ? Container(
                alignment: Alignment.center,
                child: const Text(
                  "You don't have any favorites yet!",
                  style: TextStyle(fontSize: 24, color: Color(0xFF8C8C8C)),
                ),
              )
            : ReorderableListView.builder(
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  return Container(
                    key: ValueKey(provider.favorites[index]),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Stack(children: [
                          Image.network(provider.favorites[index].thumbnail!),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              decoration: const ShapeDecoration(
                                  shape: CircleBorder(eccentricity: 1),
                                  color: Colors.redAccent),
                              child: IconButton(
                                  onPressed: () {
                                    provider.removeFromFavorites(
                                        provider.favorites[index]);
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle_rounded,
                                    color: Colors.white,
                                  )),
                            ),
                          )
                        ]),
                        const SizedBox(width: 0, height: 8),
                        Text(provider.favorites[index].title!,
                            style: const TextStyle(fontSize: 18)),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                          products:
                                              provider.favorites[index])));
                            },
                            child: const Text("إقرأ المزيد"))
                      ],
                    ),
                  );
                },
                itemCount: provider.favorites.length,
                onReorder: (int oldIndex, int newIndex) {
                  if (newIndex > oldIndex) {
                    newIndex--;
                  }
                  final task = provider.favorites.removeAt(oldIndex);
                  provider.favorites.insert(newIndex, task);
                },
              ));
  }
}
