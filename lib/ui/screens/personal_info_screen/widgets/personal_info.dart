import 'package:distro_driver_v2/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';

class PersonInfo extends StatefulWidget {
  const PersonInfo({
    super.key,
    required this.title,
    required this.info,
    required this.infoIndex,
    required this.textController,
    required this.focusNode,
    required this.textFieldEnabled,
  });

  final String title, info;
  final int infoIndex;
  final TextEditingController? textController;
  final FocusNode focusNode;
  final bool textFieldEnabled;

  @override
  State<PersonInfo> createState() => _PersonInfoState();
}

class _PersonInfoState extends State<PersonInfo> {
  late bool enableTextField;

  @override
  void initState() {
    super.initState();
    enableTextField = widget.textFieldEnabled;
    widget.textController!.text = widget.info;
    widget.focusNode.addListener(() {
      print('pressed');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: AppDimensions.width16 / 8),
          child: Text(
            widget.title,
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              color: colorBlackText,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget.textController,
                focusNode: widget.focusNode,
                enabled: enableTextField,
                style: TextStyle(
                  color: colorMediumGrey,
                  fontFamily: 'Lato',
                  fontSize: AppDimensions.getProportionateScreenHeight(21),
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            widget.infoIndex > 3
                ? TextButton(
                    onPressed: () {
                      setState(() {
                        widget.textController!.selection =
                            TextSelection.collapsed(
                          offset: widget.textController!.text.length,
                        );
                        widget.focusNode.requestFocus();
                        enableTextField = true;
                      });
                    },
                    child: Text(
                      'Change Password',
                      style: textButtonStyle,
                    ))
                : IconButton(
                    onPressed: () {
                      setState(() {
                        widget.textController!.selection =
                            TextSelection.collapsed(
                          offset: widget.textController!.text.length,
                        );
                        widget.focusNode.requestFocus();
                        enableTextField = true;
                      });
                    },
                    icon: Icon(
                      Icons.edit_outlined,
                    ),
                  )
          ],
        ),
        SizedBox(height: AppDimensions.height20),
      ],
    );
  }
}
