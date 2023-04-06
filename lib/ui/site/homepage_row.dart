import 'package:flutter/material.dart';
import '../product/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../product/product_manager.dart';
import '../../models/product.dart';

class HomepageRow extends StatelessWidget {
  final String title;
  const HomepageRow({super.key, required this.title});
  Future<void> getAll(BuildContext context) async {
    await context.read<ProductsManager>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productsManager = ProductsManager();
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
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            width: double.infinity,
            height: 200.0,
            // child: homepageGirdView(products),
            child: FutureBuilder(
              future: getAll(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return homepageGirdView(productsManager);
              },
            )),
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
                products.image,
                height: 100.0,
                width: 100.0,
                fit: BoxFit.cover,
              ),
            )),
      ),
    );
  }

  Widget homepageGirdView(ProductsManager productsManager) {
    return Consumer<ProductsManager>(builder: (ctx, productsManager, child) {
      if (productsManager.itemAcount == 0) {
        return const Padding(
          padding:  EdgeInsets.all(10.0),
          child:  Text('Không có sản phẩm', style: TextStyle(fontSize: 20.0),),
        );
      } else {
        return GridView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: productsManager.itemAcount,
          itemBuilder: (context, index) =>
              homepageGirdTite(productsManager.items[index], context),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
        );
      }
    });
  }
}
