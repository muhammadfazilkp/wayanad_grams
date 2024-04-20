// ignore_for_file: unnecessary_const
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:zudocoz/controller/creating_nots/login_provider/sign_up.dart';
import 'package:zudocoz/view/bottom_nav/bottom_navigation.dart';
import 'package:zudocoz/view/login_page/logint_page.dart';
import 'package:zudocoz/view/login_page/widget/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Consumer<SignUpMeathods>(
          builder: (context, register, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Regester"),
              const Gap(50),
              EmailTexfild(
                labeltext: "E-mail",
                controller: register.emailController,
              ),
              const Gap(12),
              Mytextfield(
                labeltext: "Password",
                controller: register.passwordController,
              ),
              const Gap(12),
              ConfirmField(
                labeltext: "Confirm passwors",
                controller: register.confirmpass,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "All ready i have account?",
                          style: TextStyle(color: Colors.brown, fontSize: 11),
                        ),
                      ),
                    ),
                  )),
              const Gap(19),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 31,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: ElevatedButton(
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            
                            register.register(
                                register.emailController.text.trim(),
                                register.passwordController.text.trim(),
                                register.confirmpass.text.trim(),
                                );

                            register.emailController.text = "";
                            register.passwordController.text = "";
                            register.confirmpass.text = "";
                            await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const BottomNavigationPage()),
                                (route) => false);
                          }
                        },
                        child: const Text(
                          "Sign-up",
                          style: TextStyle(color: Colors.brown),
                        )),
                  ),
                  const Gap(8),
                  Container(
                    height: 50,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage('asset/google-cropped-png.png'),
                            fit: BoxFit.fitWidth)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
