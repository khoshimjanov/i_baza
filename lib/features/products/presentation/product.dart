import 'package:flutter/material.dart';
import 'package:i_baza/assets/constants/image.dart';
import 'package:i_baza/assets/constants/product_name.dart';

class ProductItems extends StatelessWidget {
  const ProductItems({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(productUrls.length, (index) {
        //container nomlar
        // String category = containerName[index];

        // // rasmlar  chiqadi
        // String imageUrl = imageUrls[index];

        return Column(
          children: [
            Container(
              width: 334,
              height: 106,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 106,
                    height: 106,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF7F7F7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 12,
                          top: 12,
                          child: SizedBox(
                            width: 82,
                            child: Text(
                              containerName[index],
                              style: const TextStyle(
                                overflow: TextOverflow.clip,
                                color: Color(0xFF383838),
                                fontSize: 12,
                                fontFamily: 'Source Sans Pro',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 34,
                          top: 48,
                          child: Container(
                            width: 84,
                            height: 84,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(productUrls[index]),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
