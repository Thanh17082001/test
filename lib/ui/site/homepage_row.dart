import 'package:flutter/material.dart';
import '../product/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../product/product_manager.dart';
import '../../models/product.dart';

class HomepageRow extends StatelessWidget {
  final String title;
  const HomepageRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // final productsManager = context.read<ProductsManager>();
    final products = context.select<ProductsManager, List<Product>>(
        (productsManager) => productsManager.items);
    // final products = productsManager.
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.orange,
                fontSize: 20.0,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: SizedBox(
          width: double.infinity,
          height: 200.0,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) =>
                homepageGirdTite(products[index], context),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
          ),
        ),
      ),
    ]);
  }

  Widget homepageGirdTite(Product products, BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        height: 300.0,
        width: 250.0,
        child: GridTile(
            footer: GridTileBar(
                backgroundColor: Colors.red,
                title: Text(
                  products.name,
                  style: const TextStyle(color: Colors.black),
                )),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(ProductDetailScreen.routeName, arguments: '1');
              },
              child: Image.network(
                products.imageUrl,
                height: 100.0,
                width: 100.0,
                fit: BoxFit.cover,
              ),
            )),
      ),
    );
  }
}
