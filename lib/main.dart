import 'package:flutter/material.dart';
import 'package:http_connection/screens/main_screen.dart';
import 'package:provider/provider.dart';

import 'data/articles_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ProductsProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const ListPage(),
    );
  }
}
