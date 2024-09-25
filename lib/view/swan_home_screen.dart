import 'package:alison_task/resources/asset_urls.dart';
import 'package:alison_task/view/widgets/swan_home_main_banner.dart';
import 'package:alison_task/view/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class SwanHomeScreen extends StatelessWidget {
  const SwanHomeScreen({super.key});

  static const List<dynamic> wid1list = [
    BrandWidget(imagePath: AssetUrls.ourBrand1, title: 'MAX&Co'),
    BrandWidget(imagePath: AssetUrls.ourBrand3, title: 'PENNIBLACK'),
    BrandWidget(imagePath: AssetUrls.ourBrand2, title: 'LIU•JO')
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, size.height),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(AssetUrls.appLogo),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(AssetUrls.searchIcon),
                      const SizedBox(width: 20),
                      Image.asset(AssetUrls.favIcon),
                      const SizedBox(width: 20),
                      Image.asset(AssetUrls.cartIcon),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainBanner(size: size),
            const TitlesWidget(
              title: "Our Brands",
            ),
            Padding(
                padding: const EdgeInsets.only(left: 8),
                child: SizedBox(
                  height: size.height * 0.2,
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return wid1list[index];
                    },
                  ),
                )),
            const TitlesWidget(
              title: "Our Products",
            ),
            SizedBox(
              height: size.height * 0.40,
              width: double.infinity,
              child: Center(
                  child: Stack(
                children: [
                  Positioned(
                    left: -110,
                    top: 50,
                    child: Transform.rotate(
                        angle: -.3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: const OurProductsWidget(
                              assetUrl: AssetUrls.ourProductLeft),
                        )),
                  ),
                  Positioned(
                      top: 50,
                      right: -110,
                      child: Transform.rotate(
                          angle: .3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: const OurProductsWidget(
                                assetUrl: AssetUrls.ourProductRight),
                          ))),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: size.height * 0.3,
                      width: 250,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              opacity: .25,
                              fit: BoxFit.fitWidth,
                              image: AssetImage(AssetUrls.appLogo))),
                    ),
                  ),
                  const Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          OurProductsWidget(
                            isCentre: true,
                            assetUrl: AssetUrls.ourProduct1,
                          ),
                          Text(
                            "Furla 1927 L Tote",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "OMR 75.000",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ],
              )),
            ),
            const TitlesWidget(
              title: 'Suggested For You',
            )
          ],
        ),
      ),
    );
  }
}

class OurProductsWidget extends StatelessWidget {
  final String assetUrl;
  final bool isCentre;
  const OurProductsWidget(
      {super.key, required this.assetUrl, this.isCentre = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isCentre ? 200 : 180,
      child: Stack(
        children: [
          Image(
              fit: BoxFit.cover,
              height: isCentre ? null : 200,
              width: isCentre ? 200 : 180,
              image: AssetImage(assetUrl)),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: isCentre ? 30 : 15, vertical: 20),
                child: isCentre
                    ? const Icon(Icons.favorite_border)
                    : const Icon(Icons.favorite),
              )),
        ],
      ),
    );
  }
}

class BrandWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  const BrandWidget({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * 0.2,
      width: size.width / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            colorFilter:
                const ColorFilter.mode(Colors.black26, BlendMode.darken),
            image: AssetImage(imagePath)),
      ),
      child: Center(
          child: Text(
        title,
        style: TextStyle(
          fontSize: title == "PENNIBLACK" ? 18 : 21,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
