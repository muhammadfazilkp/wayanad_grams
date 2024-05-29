import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zudocoz/view/home/home_page.dart';
import 'package:zudocoz/view/login_page/widget/custom_textfield.dart';

import '../../controller/dish_details/dish_details.dart';

class ProfileViewscreen extends StatelessWidget {
  ProfileViewscreen({Key? key}) : super(key: key);
  final statekey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Consumer<DishDetailsProvider>(
            builder: (context, data, _) => Form(
              key: statekey,
              child: Column(
                children: [
                  const Gap(13),
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 88,
                      backgroundImage: data.dishImage != null
                          ? FileImage(File(data.dishImage!.path))
                          : const AssetImage(
                                  "asset/Gemini_Generated_Image_oxa28qoxa28qoxa2.jpeg")
                              as ImageProvider,
                      child: Center(
                        child: IconButton(
                            onPressed: () {
                              data.getImage();
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 35,
                            )),
                      ),
                    ),
                  ),
                  const Gap(15),
                  Mytextfield(
                    labeltext: "Dish Name",
                    controller: data.dishnameController,
                  ),
                  const Gap(5),
                  Mytextfield(
                    labeltext: "Discription",
                    controller: data.dishDescriptionController,
                  ),
                  const Gap(5),
                  Mytextfield(
                    labeltext: "Price",
                    controller: data.dishpriceController,
                  ),
                  const Gap(20),
                  ElevatedButton(
                      onPressed: () async {
                        if (statekey.currentState!.validate()) {
                          data.addToDb(
                              data.dishnameController.text,
                              data.dishDescriptionController.text,
                              data.dishpriceController.text);
                        }
                        // ignore: use_build_context_synchronously
                        // Navigator.of(context).pop(MaterialPageRoute(
                        //     builder: (context) => const HomeScreen()));
                        // print("Success");
                      },
                      child: Text(
                        "proceed",
                        style: GoogleFonts.poppins(),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
