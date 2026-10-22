import 'package:flutter/material.dart';
import 'package:flutter_diary/utils.dart';
import 'package:flutter_diary/widget/info_card.dart';
import 'package:rive/rive.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset selectedMenu = sideMenus.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288,
      height: double.infinity,
      color: const Color(0xFF17203A),
      child: SafeArea(
        child: Column(
          children: [
            const InfoCard(title: "Kevin Chen", subtitle: "YouTuber"),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 32, bottom: 16),
              child: Text(
                "Browse".toUpperCase(),
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: Colors.white70),
              ),
            ),
            ...sideMenus.map(
              (menu) => SideMenuTile(
                menu: menu,
                press: () {
                  menu.input!.change(true);
                  Future.delayed(const Duration(seconds: 2), () {
                    if (!mounted) return;
                    menu.input!.change(false);
                  });
                  setState(() {
                    selectedMenu = menu;
                  });
                },
                riveonInit: (artboard) {
                  StateMachineController controller = Utils.getRiveController(
                    artboard,
                    stateMachineName: menu.stateMachineName,
                  );
                  menu.input = controller.findSMI("active") as SMIBool;
                },
                isActive: selectedMenu == menu,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
