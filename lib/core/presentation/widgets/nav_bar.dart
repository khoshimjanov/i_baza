import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_baza/gen/assets.gen.dart';

class BottomNavbar extends StatelessWidget {
  final void Function(int index) selectPage;
  final int index;

  const BottomNavbar({
    super.key,
    required this.selectPage,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    const activeColor = Colors.black;
    const inActiveColor = Colors.grey;

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(32),
      ),
      child: BottomNavigationBar(
        backgroundColor: const Color(0xffF9FAFB),
        onTap: (ind) {
          selectPage(ind);
        },
        unselectedFontSize: 11,
        selectedFontSize: 11,
        currentIndex: index,
        showUnselectedLabels: true,
        selectedLabelStyle:
            const TextStyle(color: activeColor, fontWeight: FontWeight.w500),
        unselectedLabelStyle:
            const TextStyle(color: inActiveColor, fontWeight: FontWeight.w500),
        selectedItemColor: activeColor,
        unselectedItemColor: inActiveColor,
        selectedIconTheme: const IconThemeData(color: activeColor),
        unselectedIconTheme: const IconThemeData(color: inActiveColor),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.home,
              colorFilter: ColorFilter.mode(
                  index == 0 ? activeColor : inActiveColor, BlendMode.srcIn),
            ),
            label: 'Asosiy',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.catalog,
              colorFilter: ColorFilter.mode(
                  index == 1 ? activeColor : inActiveColor, BlendMode.srcIn),
              height: 22,
              width: 22,
            ),
            label: 'Katalog',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.buy,
              colorFilter: ColorFilter.mode(
                  index == 2 ? activeColor : inActiveColor, BlendMode.srcIn),
            ),
            label: 'Buyurtmalar',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.orders,
              colorFilter: ColorFilter.mode(
                  index == 3 ? activeColor : inActiveColor, BlendMode.srcIn),
            ),
            label: 'Savatcha',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.user,
              colorFilter: ColorFilter.mode(
                  index == 4 ? activeColor : inActiveColor, BlendMode.srcIn),
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
