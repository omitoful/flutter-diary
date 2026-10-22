import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_diary/utils.dart';
import 'package:rive/rive.dart';

class RiveView extends StatefulWidget {
  const RiveView({super.key});

  @override
  State<RiveView> createState() => _RiveViewState();
}

class _RiveViewState extends State<RiveView> {
  bool isLoading = false;
  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                setState(() {
                  isLoading = true;
                });
                await Future.delayed(const Duration(seconds: 2));
                if (!mounted) return;
                final random = Random();
                bool isSuccess = random.nextBool();

                if (isSuccess) {
                  check.fire();
                } else {
                  error.fire();
                }

                await Future.delayed(const Duration(seconds: 2));
                if (!mounted) return;
                setState(() {
                  isLoading = false;
                });
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: const BoxDecoration(
                  color: Colors.black87,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white),
              ),
            ),
            isLoading
                ? Positioned.fill(
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: RiveAnimation.asset(
                        'assets/checkerror.riv',
                        onInit: (artboard) {
                          StateMachineController controller = Utils.getRiveController(
                            artboard,
                          );
                          check = controller.findSMI("Check") as SMITrigger;
                          error = controller.findSMI("Error") as SMITrigger;
                          reset = controller.findSMI("Reset") as SMITrigger;
                        },
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
