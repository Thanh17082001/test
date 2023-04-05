import 'package:flutter/material.dart';
import './screen_app.dart';
import './ui/product/product_detail_screen.dart';
import 'package:provider/provider.dart';
import './ui/product/product_manager.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx)=>ProductsManager())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Ứng dụng đặt trà sữa",
          theme: ThemeData(
              fontFamily: 'Lato',
              colorScheme:
                  ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(
                secondary: Colors.deepOrange,
              )),
          home: const Homepage(),
          routes: {
            ProductDetailScreen.routeName:(context) =>const ProductDetailScreen(),
          },
          ),
    );
  }
}
