import 'package:flutter/material.dart';
import 'package:flutter_diary/view/rive_view.dart';
import 'package:flutter_diary/widget/back_view.dart';
import 'package:flutter_diary/widget/front_view.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  bool isFront = true;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search_rounded),
                    iconSize: 30,
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.short_text_rounded),
                    iconSize: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            DropdownButton(
              value: '2026',
              items: const [DropdownMenuItem(value: '2026', child: Text('2026'))],
              onChanged: (value) {},
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: PageView.builder(
                  controller: PageController(initialPage: 0, viewportFraction: 0.8),
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  itemBuilder: (_, i) => AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      final value = controller.value;
                      final bool showFront = value < 0.5;
                      final angle = value * 3.14159;

                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001) // 加上透視感 (Perspective)
                          ..rotateY(angle),
                        alignment: Alignment.center,
                        child: Transform(
                          transform: Matrix4.identity()..rotateY(showFront ? 0 : 3.14159),
                          alignment: Alignment.center,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: isFront ? Colors.cyan : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(color: Colors.black26, blurRadius: 8),
                              ],
                            ),
                            child: isFront
                                ? FrontView(monthIndex: i)
                                : BackView(monthIndex: i),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    width: 160,
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.wb_sunny_rounded),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Today',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Oct 20/2026',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(
                        context,
                      ).push(MaterialPageRoute(builder: (context) => const RiveView()));
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: const BoxDecoration(
                        color: Colors.black87,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.mode_edit_outlined, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFront = !isFront;
                      });
                      if (isFront) {
                        controller.forward();
                      } else {
                        controller.reverse();
                      }
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: isFront ? Colors.black87 : Colors.cyan,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFront ? Icons.calendar_month_rounded : Icons.undo_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
