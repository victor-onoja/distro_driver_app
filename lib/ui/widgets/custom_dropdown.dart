import 'package:distro_driver_v2/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> options;
  final String selectedOption;
  final void Function(String?)? onChanged;
  final bool isPrefixIconShow;
  final EdgeInsetsGeometry? padding;
  final IconData prefixIcon;

  CustomDropdown({
    required this.options,
    required this.selectedOption,
    required this.onChanged,
    this.isPrefixIconShow = true,
    this.padding,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4.0),
      ),
      height: 7.h,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 0.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          prefixIcon: isPrefixIconShow
              ? Icon(
                  prefixIcon,
                  color: colorPrimary,
                )
              : null,
        ),

        value: selectedOption,
        onChanged: onChanged,
        // underline: SizedBox(),
        focusColor: colorPrimary,

        icon: Icon(
          Icons.expand_more_outlined,
          color: colorPrimary,
          size: 22.sp,
        ),
        isExpanded: true,
        items: options.map<DropdownMenuItem<String>>((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList(),
      ),
    );
  }
}
