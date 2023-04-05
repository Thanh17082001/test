import 'package:flutter/material.dart';


class BannerHomePage extends StatelessWidget {
  const BannerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const src =
        'https://printgo.vn/uploads/media/792227/banner-quang-cao-tra-sua-7_1623309814.png';
    return Container(
      margin: const EdgeInsets.only(top: 0.0),
      child: SizedBox(
        height: 200.0,
        child: Image.network(
          src,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}