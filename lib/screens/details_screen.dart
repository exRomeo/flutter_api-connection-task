import 'package:flutter/material.dart';
import 'package:http_connection/data/response_model.dart';

class DetailsScreen extends StatelessWidget {
  final Product products;

  const DetailsScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(products.title!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(products.thumbnail!),
            const SizedBox(height: 16),
            Text(products.description!),
          ],
        ),
      ),
    );
  }
}
