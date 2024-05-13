import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:zudocoz/controller/creating_nots/login_provider/sign_up.dart';
import 'package:zudocoz/view/login_page/sign_up.dart';
import 'package:zudocoz/view/login_page/widget/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    return Scaffold(
        body: Consumer<SignUpMeathods>(
      builder: (context, value, child) => Form(
        key: formkey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Mytextfield(
                labeltext: 'Username/E-mail',
                controller: value.emailController,
              ),
              const Gap(10),
              Mytextfield(
                labeltext: "Password",
                controller: value.passwordController,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "forgot password? ",
                      style: TextStyle(color: Colors.brown),
                    )),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 40,
                  width: 120,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          value.signIn(value.emailController.text,
                              value.passwordController.text.trim());

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                        }
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.brown)),
                      child: const Text(
                        "Sign in",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
