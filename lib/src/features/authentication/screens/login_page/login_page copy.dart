import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_project_1/src/common_widgets/gradient_button.dart';
import 'package:mini_project_1/src/constants/image_strings.dart';
import 'package:mini_project_1/src/features/animations/animatedEnum.dart';

import 'package:rive/rive.dart';

// import '../../../animations/AnimationEnum.dart';

class MyAnimationEnumLoginScreen extends StatefulWidget {
  const MyAnimationEnumLoginScreen({super.key});

  @override
  State<MyAnimationEnumLoginScreen> createState() =>
      _MyAnimationEnumLoginScreenState();
}

class _MyAnimationEnumLoginScreenState
    extends State<MyAnimationEnumLoginScreen> {
  Artboard? _artboard;
  late RiveAnimationController idle;
  late RiveAnimationController handsDown;
  late RiveAnimationController Hands_up;
  late RiveAnimationController success;
  late RiveAnimationController fail;
  late RiveAnimationController Look_left;
  late RiveAnimationController Look_right;

  @override
  void initState() {
    super.initState();
    idle = SimpleAnimation(AnimationEnum.idle.name);
    handsDown = SimpleAnimation(AnimationEnum.hands_down.name);
    Hands_up = SimpleAnimation(AnimationEnum.Hands_up.name);
    success = SimpleAnimation(AnimationEnum.success.name);
    fail = SimpleAnimation(AnimationEnum.fail.name);
    Look_left = SimpleAnimation(AnimationEnum.Look_down_left.name);
    Look_right = SimpleAnimation(AnimationEnum.Look_down_right.name);
    rootBundle.load(myLoginPageBearAnimation).then((value) {
      final file = RiveFile.import(value);
      final artboard = file.mainArtboard;
      artboard.addController(idle);
      setState(() {
        _artboard = artboard;
      });
    });
    password.addListener(onFocus);
  }

  FocusNode password = FocusNode();
  void onFocus() {
    if (password.hasFocus) {
      addHandsUp();
    } else {
      addHandsDown();
    }
  }

  void removeAllController() {
    _artboard!.artboard.removeController(idle);
    _artboard!.artboard.removeController(handsDown);
    _artboard!.artboard.removeController(Hands_up);
    _artboard!.artboard.removeController(success);
    _artboard!.artboard.removeController(fail);
    _artboard!.artboard.removeController(Look_left);
    _artboard!.artboard.removeController(Look_right);
  }

  void addIdle() {
    removeAllController();
    _artboard!.artboard.addController(idle);
  }

  void addHandsUp() {
    removeAllController();
    _artboard!.artboard.addController(Hands_up);
  }

  void addHandsDown() {
    removeAllController();
    _artboard!.artboard.addController(handsDown);
  }

  void addSuccess() {
    removeAllController();
    _artboard!.artboard.addController(success);
  }

  void addFail() {
    removeAllController();
    _artboard!.artboard.addController(fail);
  }

  void addLookDownLeft() {
    // lookLeft = true;
    removeAllController();
    _artboard!.artboard.addController(Look_left);
  }

  void addLookDownRight() {
    // lookRight = true;
    removeAllController();
    _artboard!.artboard.addController(Look_right);
  }

  // bool lookLeft = false;
  // bool lookRight = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD6E2EA),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: _artboard == null
                ? const SizedBox()
                : Rive(
                    artboard: _artboard!,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .3),
                            blurRadius: 20,
                            offset: Offset(0, 10))
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey.shade100),
                          ),
                        ),
                        child: TextField(
                          onChanged: (value) {
                            addHandsUp();
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          focusNode: password,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                    onTap: () {
                      // addFail();
                    },
                    child: const GradientButton()),
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  "Forgot Password?",
                  style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
