import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabItem extends StatelessWidget {
  final String title;
  const TabItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Center(
          child: Text(title,
              style:
                  GoogleFonts.poppins(fontSize: 9, fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis)),
    );
  }
}
