import 'package:distro_driver_v2/core/constants/app_dimensions.dart';
import 'package:distro_driver_v2/core/constants/colors.dart';
import 'package:distro_driver_v2/core/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum RadioButtonValue {
  english,
  french,
  hindi,
  yoruba,
  hausa,
  igbo;

  static getLanguage(value) {
    switch (value) {
      case RadioButtonValue.english:
        return 'English';
      case RadioButtonValue.french:
        return 'French';
      case RadioButtonValue.hausa:
        return 'Hausa';
      case RadioButtonValue.hindi:
        return 'Hindi';
      case RadioButtonValue.yoruba:
        return 'Yoruba';
      case RadioButtonValue.igbo:
        return 'Igbo';
    }
  }
}

class LanguageScreen extends StatefulWidget {
  static const String routeName = '/language';
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  var selectedLanguage = RadioButtonValue.english;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        leading: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 10,
          ),
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: AppDimensions.getProportionateScreenHeight(26)),
          Container(
            padding: EdgeInsets.only(
              left: AppDimensions.getProportionateScreenWidth(25),
            ),
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/app_language_icon.svg"),
                SizedBox(width: AppDimensions.getProportionateScreenWidth(27)),
                Text(
                  'App Language',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: AppDimensions.height16,
                    fontWeight: FontWeight.w500,
                    color: colorBlack,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppDimensions.getProportionateScreenHeight(28)),
          buildRadioListTile(
            language: RadioButtonValue.english,
            img: ImgAssets.imgEnglish,
          ),
          Divider(
            thickness: 2,
            height: 2,
            color: colorDivider,
          ),
          buildRadioListTile(
              language: RadioButtonValue.hausa, img: ImgAssets.imgNigeria),
          buildRadioListTile(
            language: RadioButtonValue.igbo,
            img: ImgAssets.imgNigeria,
          ),
          buildRadioListTile(
            language: RadioButtonValue.yoruba,
            img: ImgAssets.imgNigeria,
          ),
          buildRadioListTile(
            language: RadioButtonValue.french,
            img: ImgAssets.imgFrench,
          ),
          buildRadioListTile(
            language: RadioButtonValue.hindi,
            img: ImgAssets.imgHindi,
          ),
        ],
      ),
    );
  }

  RadioListTile<RadioButtonValue> buildRadioListTile(
      {required var language, required String img}) {
    return RadioListTile(
      value: language,
      groupValue: selectedLanguage,
      onChanged: (value) {
        setState(() {
          selectedLanguage = value!;
        });
      },
      controlAffinity: ListTileControlAffinity.trailing,
      title: Container(
        margin: EdgeInsets.only(bottom: AppDimensions.height16 / 2),
        child: Row(
          children: [
            Container(
              height: AppDimensions.getProportionateScreenHeight(50),
              width: AppDimensions.getProportionateScreenWidth(50),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: AppDimensions.getProportionateScreenWidth(14)),
            Text(
              RadioButtonValue.getLanguage(language),
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: AppDimensions.height16,
                fontWeight: FontWeight.w400,
                color: colorBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
