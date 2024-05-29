import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zudocoz/view/home/widget/bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, Key? ky});

  @override
  Widget build(BuildContext context) {
    var size;
    var height;
    var width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    final sheetModel = BottomSheetModel();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Gap(10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Image.asset("asset/logo.png"),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        "asset/circuler.avif",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.notifications,
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
                      hintStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(
                        Icons.coffee,
                        color: Colors.white,
                      ),
                      labelText: "Search your coffie",
                      labelStyle: const TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.0),
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
                  height: 170, 
                  // Adjust as needed
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          sheetModel.showModal(context);
                        },
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(8),
                              height: 120,
                              width: 130,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image:
                                        AssetImage('asset/coffie_image.jpeg'),
                                    fit: BoxFit.cover),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Text(
                              "Coffie planet",
                              style: GoogleFonts.poppins(color: Colors.white),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Gap(30),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 12,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height * 1)
                      // crossAxisSpacing: 6,
                      // mainAxisSpacing: 6,
                      // childAspectRatio:.0,
                      ),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 350, // Increased height to 250
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage(
                                "asset/Gemini_Generated_Image_oxa28qoxa28qoxa2.jpeg"),
                            fit: BoxFit.cover,
                          ),
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
                              top: 250,
                              right: 0,
                              left: 0,
                              child: Container(
                                height: 100,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(0.8),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Coffie breastoit",
                                        style: GoogleFonts.poppins(),
                                      ),
                                    ),
                                    Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it",
                                      maxLines: 4,
                                      style: GoogleFonts.poppins(fontSize: 13),
                                    ),
                                    const Gap(5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Price:600",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const CircleAvatar(
                                          backgroundColor: Colors.brown,
                                          child: Icon(
                                            CupertinoIcons.bag,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
