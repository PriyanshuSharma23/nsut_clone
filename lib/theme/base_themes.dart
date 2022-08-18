import 'package:google_fonts/google_fonts.dart';

mixin BaseTheme {
  font() {
    return GoogleFonts.poppinsTextTheme().copyWith(
      caption: GoogleFonts.montserratTextTheme().caption!.copyWith(
            fontSize: 14,
          ),
    );
  }
}
