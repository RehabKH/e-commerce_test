import 'package:flutter/material.dart';
import 'package:test_flutter/cartProvider.dart';
import 'package:test_flutter/homePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
    ],
    child: const MyApp(),
  ));
  // Provider<CartProvider>(
  //   create: (context) => CartProvider(), child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}
