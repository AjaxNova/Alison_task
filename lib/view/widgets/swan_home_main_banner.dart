import 'package:alison_task/resources/asset_urls.dart';
import 'package:flutter/material.dart';

class MainBanner extends StatelessWidget {
  const MainBanner({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.4,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: size.height / 3.4,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    colorFilter:
                        ColorFilter.mode(Colors.black26, BlendMode.darken),
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AssetUrls.mainBanner,
                    )),
              ),
            ),
          ),
          SizedBox(
            height: size.height / 3.4,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'LIU•JO',
                    style: TextStyle(
                        height: 4,
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
                height: 40,
                width: 120,
                child: const Center(
                  child: Text(
                    "Shop Now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
