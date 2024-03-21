import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:zudocoz/controller/creating_nots/notes.dart';

class SplashScreeb extends StatelessWidget {
  const SplashScreeb({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<LocalDatas>(context, listen: false).navigate(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 400,
            width: 600,
            child: Center(
              child: Lottie.asset(
                  "asset/animation/Animation - 1709718267551.json"),
            ),
          ),
        ],
      ),
    );
  }
}
