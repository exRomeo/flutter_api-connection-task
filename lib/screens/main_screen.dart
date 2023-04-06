import 'package:flutter/material.dart';
import 'package:http_connection/data/articles_provider.dart';
import 'package:provider/provider.dart';

import 'details_screen.dart';
import 'favorites_screen.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductsProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("List Page"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FavoritesScreen()));
                },
                icon: const Icon(Icons.star_half_rounded))
          ],
        ),
        body: provider.products.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: provider.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(children: [
                        Image.network(provider.products[index].thumbnail!),
                        Positioned(
                          top: 5,
                          right: 5,
                          child: Container(
                              decoration: const ShapeDecoration(
                                  shape: CircleBorder(eccentricity: 1),
                                  color: Colors.yellow),
                              child: IconButton(
                                  onPressed: () {
                                    provider.addToFavorites(
                                        provider.products[index]);
                                  },
                                  icon: const Icon(Icons.star_border))),
                        ),
                      ]),
                      const SizedBox(width: 0, height: 8),
                      Text(
                        provider.products[index].title!,
                        style: const TextStyle(fontSize: 18),
                      ), // Title above button
                      ElevatedButton(
                        child: const Text("إقرأ المزيد"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                      products: provider.products[index])));
                        },
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ));
  }
}
