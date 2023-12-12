import 'package:distro_driver_v2/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatelessWidget {
  final BuildContext? context;
  final String title;
  final VoidCallback onPress;
  final double? width;
  final double? height;
  final Color textColor;
  final Color buttonColor;
  final Color? buttonBorderColor;
  final double textSize;
  final FontWeight fontWeight;
  final bool isLoading;
  final String? svgAsset;

  const CustomButton({
    super.key,
    required this.onPress,
    this.width,
    this.height,
    this.title = "Click Me",
    this.textColor = Colors.white,
    this.context,
    this.textSize = 18.0,
    this.fontWeight = FontWeight.w500,
    this.buttonColor = colorPrimary,
    this.buttonBorderColor,
    this.isLoading = false,
    this.svgAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 5.h,
      width: width ?? 40.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11.px),
          color: buttonColor,
          border: Border.all(color: buttonBorderColor ?? colorPrimary)
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     // Color(0xff21C4FA),
          //     // Color(0xff338DFD),
          //     Theme.of(context).colorScheme.surface,
          //     Theme.of(context).colorScheme.secondary,
          //
          //     // Theme.of(context).colorScheme.primary,
          //   ],
          // ),
          ),
      child: Material(
        borderRadius: BorderRadius.circular(11.px),
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.blueAccent,
          borderRadius: BorderRadius.circular(11.px),
          onTap: onPress,
          child: Center(
            child: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (svgAsset != null)
                        SvgPicture.asset(
                          svgAsset!,
                          width: 20,
                          height: 40,
                          // color: textColor,
                        ),
                      SizedBox(width: 5),
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: textColor,
                            fontWeight: fontWeight,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
