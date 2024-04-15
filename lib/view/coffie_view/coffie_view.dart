
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 450,
              width: double.infinity,
              decoration: const BoxDecoration(
                  // color: Colors.grey,
                  image: DecorationImage(
                      image: AssetImage("asset/circuler.avif"),
                      fit: BoxFit.cover),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.grey,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 15, top: 10),
                    child: Icon(
                      Icons.favorite_border,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
            const Gap(20),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.brown,
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 5, left: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Chocalate Coffie",
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.white),
                        ),
                        Text(
                          "\$ 8.55",
                          style: GoogleFonts.poppins(
                              fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'With Chocalate',
                          style: GoogleFonts.poppins(
                              fontSize: 11, color: Colors.white),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("4.9 (150)"),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            child: Center(
                                child: Text(
                              "Add to cart",
                              style: GoogleFonts.poppins(color: Colors.white),
                            )),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Gap(10),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Discription",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              maxLines: 4,
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              style: GoogleFonts.poppins(color: Colors.white),
            ),
            const Gap(20),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.brown,
              ),
              child: Center(
                child: Text(
                  "Buy now",
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
