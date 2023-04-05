import 'package:flutter/material.dart';
import 'package:test_app/ui/site/homepage_row.dart';
import '../site/homepage_banner.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        BannerHomePage(),
        HomepageRow(title: 'Tin Tức'),
        HomepageRow(title: 'Khuyễn Mãi')
      ],
    );
  }
}
