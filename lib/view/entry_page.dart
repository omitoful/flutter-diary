import 'package:flutter/material.dart';
import 'package:flutter_diary/utils.dart';
import 'package:flutter_diary/widget/animated_bar.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  RiveAsset selectedBottomNav = bottomNavs.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.black12.withValues(alpha: 0.75),
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                bottomNavs.length,
                (index) => GestureDetector(
                  onTap: () {
                    bottomNavs[index].input!.change(true);
                    if (bottomNavs[index] != selectedBottomNav) {
                      setState(() {
                        selectedBottomNav = bottomNavs[index];
                      });
                    }
                    Future.delayed(const Duration(seconds: 2), () {
                      if (!mounted) return;
                      bottomNavs[index].input!.change(false);
                    });
                  },
                  child: AnimatedBar(
                    isActive: bottomNavs[index] == selectedBottomNav,
                    activeIndex: index,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
