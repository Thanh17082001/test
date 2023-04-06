import 'package:flutter/foundation.dart';
import '../../models/product.dart';
import '../../services/product_services.dart';

class ProductsManager with ChangeNotifier {
  final productsServices = ProductsServices();

  List<Product> _items = [
    // Product(
    //     id: '1',
    //     name: 'Trà Sữa Truyền Thống',
    //     description: 'Không kết hợp với bất kì hương vị trái cây nào!',
    //     price: 15.000,
    //     imageUrl:
    //         'https://cdn.tgdd.vn/Files/2021/08/10/1374160/hoc-2-cach-pha-tra-sua-truyen-thong-thom-ngon-chuan-vi-ai-cung-me-202203031716377004.jpg'),
    // Product(
    //     id: '2',
    //     name: 'Trà Sữa Socola',
    //     description: 'Kết hợp với vị sô cô la !',
    //     price: 18.000,
    //     imageUrl:
    //         'https://jarvis.vn/wp-content/uploads/2019/05/tra%CC%80-su%CC%83a-socola.jpg'),
    // Product(
    //     id: '3',
    //     name: 'Trà Sữa matcha',
    //     description: 'Kết hợp với vị mat cha trà xanh thơm mát!',
    //     price: 20.000,
    //     imageUrl:
    //         'https://beponghoang.com/wp-content/uploads/2022/10/tra-sua-matcha-kem-cheese.jpg'),
    // Product(
    //     id: '4',
    //     name: 'Trà Sữa vị dâu',
    //     description: 'Kết hợp với hương dâu ngọt ngào!',
    //     price: 22.000,
    //     imageUrl:
    //         'https://cdn.nguyenkimmall.com/images/detailed/746/cach-lam-tra-sua-dau-5.jpg.jpg'),
    // Product(
    //     id: '4',
    //     name: 'Trà Sữa vị dâu',
    //     description: 'Kết hợp với hương dâu ngọt ngào!',
    //     price: 22.000,
    //     imageUrl:
    //         'https://cdn.nguyenkimmall.com/images/detailed/746/cach-lam-tra-sua-dau-5.jpg.jpg'),
    // Product(
    //     id: '4',
    //     name: 'Trà Sữa vị dâu',
    //     description: 'Kết hợp với hương dâu ngọt ngào!',
    //     price: 22.000,
    //     imageUrl:
    //         'https://cdn.nguyenkimmall.com/images/detailed/746/cach-lam-tra-sua-dau-5.jpg.jpg'
    // ),
  ];
  List<Product> get items {
    return [..._items];
  }

  Future<void> fetchProducts() async {
    _items = await productsServices.fetchProducts();
    notifyListeners();
  }

  int get itemAcount {
    return _items.length;
  }
}
