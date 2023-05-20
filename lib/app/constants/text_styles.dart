import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static final kHeadingTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 24.sp,
  );

  static final kbodyLargeTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
  );

  static final kbodyMediumTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );

  static final kbodysmallTextStyle = GoogleFonts.raleway(
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );
}
