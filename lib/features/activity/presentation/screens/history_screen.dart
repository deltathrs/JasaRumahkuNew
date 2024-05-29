import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.all(22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          historyBox('JL. Merauke - NTT No. 12, BANDUNG',
              'assets/img/dashboard/electric_icon.png', '1 Okt, 06:12 PM'),
          historyBox('JL. Baiduri Pandan No.28 , JAKARTA',
              'assets/img/dashboard/truck_icon.png', '12 Okt, 02:12 PM'),
        ],
      ),
    ));
  }

  Widget historyBox(String address, String icon, String date) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          children: [
            Container(
              width: 317,
              height: 105,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // '1 Okt, 06:12 PM',
                    date,
                    style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF6E6E6E)),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      boxLayanan(icon),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              // 'JL. Merauke - NTT No. 12, BANDUNG',
                              address,
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF6E6E6E)),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 250,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 14,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      'Selesai',
                                      style: GoogleFonts.poppins(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF6E6E6E)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Lihat detail',
                                      style: GoogleFonts.poppins(
                                          fontSize: 7,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFFFF0000)),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 10,
                                      color: Color(0xFFFF00000),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned.fill(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 2,
                color: Color(0xFFD9D9D9),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget boxLayanan(String icon) {
    return SizedBox(
      width: 62,
      child: Container(
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
    );
  }
}
