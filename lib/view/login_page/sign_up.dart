import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zudocoz/controller/creating_nots/login_provider/sign_up.dart';
import 'package:zudocoz/view/login_page/logint_page.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Consumer<SignUpMeathods>(
          builder: (context, register, child) => Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "asset/Gemini_Generated_Image_45qc8s45qc8s45qc.jpeg",
                    ),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                  width: 360,
                  child: TextFormField(
                    controller: register.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        labelText: "Email",
                        labelStyle: GoogleFonts.poppins(color: Colors.black),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                const Gap(10),
                SizedBox(
                  height: 60,
                  width: 360,
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: register.passwordController,
                    validator: (input) {
                      if (input!.length < 6) {
                        return "Your password needs to be at least 6 characters";
                      }
                      return null;
                    },
                    obscureText: register.passwordVisiblity,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.password),
                      
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                register.passwordVisiblity =
                                    !register.passwordVisiblity;
                              });
                            },
                            icon: Icon(
                              register.passwordVisiblity == true
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                            )),
                        labelText: "Passcode",
                        labelStyle: GoogleFonts.poppins(color: Colors.black),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
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
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          ),
                        ),
                      ),
                    )),
                const Gap(19),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 80,
                      child: ElevatedButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              register.register(
                                  register.emailController.text.trim(),
                                  register.passwordController.text.trim(),
                                  context);

                              register.emailController.text = "";
                              register.passwordController.text = "";
                            }
                          },
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.brown)),
                          child: Text("Sign-up",
                              style: GoogleFonts.poppins(color: Colors.white))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
