import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zudocoz/view/login_page/sign_up.dart';
import 'package:zudocoz/view/login_page/widget/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Align(
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 90.0,
            backgroundImage: AssetImage('asset/3.jpg'),
            backgroundColor: Colors.transparent,
          ),
        ),
        const Gap(10),
        const Text("Welcome back!!"),
        const Gap(10),
        const Mytextfield(labeltext: 'Username'),
        const Gap(10),
        const Mytextfield(labeltext: "Password"),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () {},
              child: const Text(
                "forgot password? ",
                style: TextStyle(color: Colors.brown),
              )),
        ),
        const Gap(180),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 40,
            width: 120,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.brown)),
                child: const Text(
                  "Sign in",
                  style: TextStyle(color: Colors.white),
                )),
          ),
        )
      ],
    ));
  }
}
