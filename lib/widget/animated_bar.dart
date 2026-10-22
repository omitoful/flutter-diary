import 'package:flutter/cupertino.dart';
import 'package:flutter_diary/utils.dart';
import 'package:rive/rive.dart';

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({super.key, required this.isActive, required this.activeIndex});
  final bool isActive;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 4,
          width: isActive ? 20 : 0,
          margin: const EdgeInsets.only(bottom: 4),
          decoration: const BoxDecoration(
            color: Color(0xFF81B4FF),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        SizedBox(
          height: 36,
          width: 36,
          child: Opacity(
            opacity: isActive ? 1 : 0.5,
            child: RiveAnimation.asset(
              bottomNavs[activeIndex].src,
              artboard: bottomNavs[activeIndex].artboard,
              onInit: (artboard) {
                StateMachineController controller = Utils.getRiveController(
                  artboard,
                  stateMachineName: bottomNavs[activeIndex].stateMachineName,
                );
                bottomNavs[activeIndex].input = controller.findSMI("active") as SMIBool;
              },
            ),
          ),
        ),
      ],
    );
  }
}
