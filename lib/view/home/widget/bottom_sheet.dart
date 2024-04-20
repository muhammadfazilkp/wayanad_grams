import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomSheetModel {
  void showModal(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.black,
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              height: 180,
              alignment: Alignment.topCenter,
              // width: 150,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("asset/coffie_image.jpeg"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "Where can I get some?",
                  style: GoogleFonts.poppins(color: Colors.white),
                )),
            const Gap(5),
            Text(
              maxLines: 6,
              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
              style: GoogleFonts.poppins(
                  color: Colors.white, fontWeight: FontWeight.w300),
            ),
            const Gap(13),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  width: 120,
                  color: Colors.white,
                  child: Center(
                      child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.poppins(color: Colors.black),
                    ),
                  )),
                ),
                Container(
                  height: 40,
                  width: 120,
                  color: Colors.brown,
                  child: Center(
                    child: Text(
                      "Get it",
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
