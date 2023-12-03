import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Induk',
          style: GoogleFonts.playfairDisplay(
            color: Colors.black,
            fontSize: 70,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'University',
          style: GoogleFonts.playfairDisplay(
            color: Colors.black,
            fontSize: 70,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Club Promotions',
          style: GoogleFonts.playfairDisplay(
            color: Colors.black,
            fontSize: 70,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
