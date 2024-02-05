import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i_baza/core/presentation/widgets/nav_bar.dart';
import 'package:i_baza/features/catalog/presentation/catalog.dart';
import 'package:i_baza/gen/assets.gen.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final titles=[
"Asosiy",
"Katalog",
"Buyurtmalar",
"Savatcha",
"Profil",



    ];
    var selectedIndex = useState(0);
    final scaffoldKey = GlobalKey<ScaffoldState>();
    var pageController = PageController();
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          leading: CupertinoButton(
            child: SvgPicture.asset(Assets.icons.appDrawer),
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          centerTitle: false,
          title:  Text(
           titles[selectedIndex.value] ,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        drawer: const Drawer(),
        body: PageView(
          controller: pageController,
          children:const [
              SizedBox(
              child: Text("homePage"),
            ),
            CatalogMain(),
          
            SizedBox(),
            SizedBox(),
            SizedBox(),
          ],
        ),
        bottomNavigationBar: BottomNavbar(
            selectPage: (index) {
              pageController.jumpToPage(
                index,
                // curve: Curves.easeIn,
                // duration: const Duration(milliseconds: 200),
              );
              selectedIndex.value = index;
            },
            index: selectedIndex.value));
  }
}
