import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, Key? ky});

  @override
  Widget build(BuildContext context) {
    String amount = "499";
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Gap(10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("asset/circuler.avif"),
                    
                  ),
                  Gap(5),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      CupertinoIcons.cart,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const Gap(5),
              Text(
                "Hello Jhone",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              
              const Gap(20),

              TextFormField(
                decoration: InputDecoration(
                    hintText: "Capitichno",
                    hintStyle: const TextStyle(color: Colors.white60),
                    prefixIcon: const Icon(Icons.coffee),
                    labelText: "Search your coffie",
                    labelStyle: const TextStyle(color: Colors.white),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.brown, width: 1.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    border: OutlineInputBorder(
                        gapPadding: 4,
                        borderRadius: BorderRadius.circular(15))),
              ),
              const Gap(15),

              SizedBox(
                height: 200,
                child: CarouselSlider(
                  items: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage('asset/banner_image .avif'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage('asset/banner_image1.avif'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    height: 200,
                    aspectRatio: 15 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              // Recommended section
              const Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recomended for you",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 130, // Adjust as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      height: 120,
                      width: 100,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('asset/coffie_image.jpeg'),
                            fit: BoxFit.cover),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Coffee Plant',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 11.0,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Gap(15),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 12,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    height: 90,
                    width: 140,
                    decoration: BoxDecoration(
                      // color: Colors.amber,
                      image: const DecorationImage(
                          image: AssetImage(
                            "asset/images.jpeg",
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        const Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          top: 130,
                          right: 0,
                          left: 0,
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0.8)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Coffie breastoit",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black, fontSize: 11),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Price:600",
                                      style: GoogleFonts.poppins(
                                          color: Colors.brown),
                                    ),
                                    const Icon(
                                      CupertinoIcons.cart,
                                      color: Colors.brown,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
