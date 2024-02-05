import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:i_baza/assets/constants/image.dart';
import 'package:i_baza/assets/constants/product_name.dart';
import 'package:i_baza/core/presentation/pages/search.dart';
import 'package:i_baza/core/presentation/pages/search2.dart';
import 'package:i_baza/features/products/presentation/product.dart';

class CatalogMain extends HookWidget {
  const CatalogMain({super.key});

  @override
  Widget build(BuildContext context) {
    var isSearch = useState(false);
    if (isSearch.value == true) {
      return SearchScreen();
    } else {
      return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[300]),
                child: GestureDetector(
                  onTap: () {
                      isSearch.value == true;
                  },
                  child: TextField(
                    onChanged: (value) {
                      isSearch.value == true;
                    },
                    onTap: () {
                      isSearch.value == true;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 400,
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(imageUrls.length, (index) {
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
                                          image: AssetImage(imageUrls[index]),
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
              ),
            ),
            SizedBox(height: 300, child: ProductItems())
          ],
        ),
      );
    }
  }
}
