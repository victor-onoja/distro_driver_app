import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BorderedTextField extends StatefulWidget {
  final TextEditingController controller;
  final Widget? prefixIcon;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final Color fillColor;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters; // Add inputFormatters
  final double? height;
  final String obscuringCharacter; // Add obscuringCharacter
  final Widget? suffixIcon;

  const BorderedTextField({
    super.key, // Fix the key parameter here

    required this.controller,
    this.prefixIcon,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.fillColor = Colors.white,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.height,
    this.suffixIcon,
    this.inputFormatters, // Add inputFormatters parameter
    this.obscuringCharacter = "*", // Add obscuringCharacter parameter
  });

  @override
  _BorderedTextFieldState createState() => _BorderedTextFieldState();
}

class _BorderedTextFieldState extends State<BorderedTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 7.5.h,
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        // maxLines: 3,
        style: GoogleFonts.lato(
          fontSize: 20.px,
        ),
        obscureText: widget.obscureText && _obscureText,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        // Add inputFormatters here
        decoration: InputDecoration(
          fillColor: widget.fillColor,
          filled: true,
          suffixIcon: widget.suffixIcon != null && widget.obscureText
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                )
              : null,
          hintText: widget.hintText,
          hintStyle: GoogleFonts.lato(
            color: Colors.grey, // Change the color as needed
            fontSize: 15.px,
          ),
          labelText: widget.labelText,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey, // Change the color as needed
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.7), // Change the color as needed
            ),
          ),
          // Add obscuringCharacter here
        ),
        obscuringCharacter: widget.obscuringCharacter,
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text('BorderedTextField Example'),
//       ),
//       body: Center(
//         child: BorderedTextField(
//           controller: TextEditingController(),
//           labelText: 'Password',
//           hintText: 'Enter your password',
//           prefixIcon: Icon(Icons.lock),
//           obscureText: true,
//         ),
//       ),
//     ),
//   ));
// }
