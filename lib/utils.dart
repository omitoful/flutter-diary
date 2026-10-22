import 'package:rive/rive.dart';

class Utils {
  static StateMachineController getRiveController(
    Artboard artboard, {
    stateMachineName = "State Machine 1",
  }) {
    StateMachineController? controller = StateMachineController.fromArtboard(
      artboard,
      stateMachineName,
    );
    if (controller == null) {
      throw Exception('找不到指定的狀態機名稱: $stateMachineName');
    }
    artboard.addController(controller);
    return controller;
  }
}

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(
    this.src, {
    required this.artboard,
    required this.stateMachineName,
    required this.title,
    this.input,
  });

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset(
    "assets/icons.riv",
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Chat",
  ),
  RiveAsset(
    "assets/icons.riv",
    artboard: "SEARCH",
    stateMachineName: "SEARCH_Interactivity",
    title: "Search",
  ),
  RiveAsset(
    "assets/icons.riv",
    artboard: "TIMER",
    stateMachineName: "TIMER_Interactivity",
    title: "History",
  ),
  RiveAsset(
    "assets/icons.riv",
    artboard: "BELL",
    stateMachineName: "BELL_Interactivity",
    title: "Notifications",
  ),
  RiveAsset(
    "assets/icons.riv",
    artboard: "USER",
    stateMachineName: "USER_Interactivity",
    title: "User",
  ),
];
