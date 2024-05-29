import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<String> adPaths = [
    "assets/img/dashboard/ad1.png",
    "assets/img/dashboard/ad1.png",
    "assets/img/dashboard/ad1.png"
  ];

  late List<Widget> _pages;

  int _activePage = 0;

  final PageController _pageController = PageController(initialPage: 0);

  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.page == adPaths.length - 1) {
        _pageController.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        _pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = List.generate(
        adPaths.length, (index) => ImagePlaceholder(imagePath: adPaths[index]));
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton:
          Image.asset('assets/img/dashboard/cust_service.png'),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Image.asset('assets/img/dashboard/logo_home.png'),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'JasaRumahku',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 316,
                    height: 143,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(22)),
                    child: PageView.builder(
                        onPageChanged: (value) {
                          setState(() {
                            _activePage = value;
                          });
                        },
                        controller: _pageController,
                        itemBuilder: (context, index) {
                          return _pages[index];
                        }),
                  ),

                  //page indicator
                  Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              _pages.length,
                              (index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: InkWell(
                                      onTap: () {
                                        _pageController.animateToPage(index,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.easeIn);
                                      },
                                      child: CircleAvatar(
                                        radius: 4,
                                        backgroundColor: _activePage == index
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                    ),
                                  )),
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Layanan',
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  boxLayanan(
                      'assets/img/dashboard/truck_icon.png', 'Angkut Barang'),
                  SizedBox(
                    width: 25,
                  ),
                  boxLayanan('assets/img/dashboard/electric_icon.png',
                      'Perbaikan Listrik'),
                  SizedBox(
                    width: 25,
                  ),
                  boxLayanan('assets/img/dashboard/water_icon.png',
                      'Perbaikan Saluran Air'),
                  SizedBox(
                    width: 25,
                  ),
                  boxLayanan('assets/img/dashboard/ac_icon.png', 'Servis \nAC')
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              'Fitur andalan, sesuaikan kebutuhanmu',
              style: GoogleFonts.poppins(
                  fontSize: 15, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/img/dashboard/fiturandalan1.png'),
                Image.asset('assets/img/dashboard/fiturandalan2.png'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget boxLayanan(String icon, String title) {
    return SizedBox(
      width: 62,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(colors: [
                Color(0xFFFF0000),
                Color(0xFFDC9E000),
              ], begin: Alignment.center, end: Alignment.bottomCenter),
            ),
            child: Center(
              child: Image.asset(icon),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            width: 62,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF6E6E6E)),
            ),
          )
        ],
      ),
    );
  }
}

class ImagePlaceholder extends StatelessWidget {
  final String? imagePath;
  const ImagePlaceholder({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Image.asset(
        imagePath!,
        fit: BoxFit.contain,
      ),
    );
  }
}
