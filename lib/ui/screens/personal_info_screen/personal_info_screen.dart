import 'package:distro_driver_v2/core/constants/app_dimensions.dart';
import 'package:distro_driver_v2/core/constants/colors.dart';
import 'package:distro_driver_v2/core/constants/screen_utils.dart';
import 'package:distro_driver_v2/core/constants/text_styles.dart';
import 'package:distro_driver_v2/ui/screens/personal_info_screen/widgets/build_photo_selection_modal.dart';
import 'package:distro_driver_v2/ui/screens/personal_info_screen/widgets/personal_info.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PersonalInfoScreen extends StatelessWidget {
  static const String routeName = '/personalInfoScreen';

  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> personalInfo = [
      {'title': 'Name', 'info': 'David Balogun'},
      {'title': 'Username', 'info': 'David Balogun'},
      {'title': 'Email', 'info': 'davidbalogun@gmail.com'},
      {'title': 'Phone Number', 'info': '+234 8123456789'},
      {'title': 'Password', 'info': '* * * * * * * *'},
    ];

    final TextEditingController nameTextController = TextEditingController();
    final TextEditingController userNameTextController =
        TextEditingController();
    final TextEditingController emailTextController = TextEditingController();
    final TextEditingController phoneNumberTextController =
        TextEditingController();
    final TextEditingController passwordTextController =
        TextEditingController();

    final FocusNode nameFocusNode = FocusNode();
    final FocusNode userNameFocusNode = FocusNode();
    final FocusNode emailFocusNode = FocusNode();
    final FocusNode phoneNumberFocusNode = FocusNode();
    final FocusNode passwordFocusNode = FocusNode();

    List<TextEditingController> textEditingController = [
      nameTextController,
      userNameTextController,
      emailTextController,
      phoneNumberTextController,
      passwordTextController,
    ];

    List<FocusNode> textFieldFocusNode = [
      nameFocusNode,
      userNameFocusNode,
      emailFocusNode,
      phoneNumberFocusNode,
      passwordFocusNode,
    ];
    List<bool> fieldEnabled = [
      false,
      false,
      false,
      false,
      false,
    ];

    return Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  'Save',
                  style: textButtonStyle.copyWith(
                    fontSize: AppDimensions.height24,
                    fontWeight: FontWeight.w700,
                  ),
                )),
            SizedBox(width: AppDimensions.width10)
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: AppDimensions.getProportionateScreenHeight(50)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          AppDimensions.getProportionateScreenWidth(107)),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //todo: show image bigger
                        },
                        child: Container(
                          height:
                              AppDimensions.getProportionateScreenHeight(150),
                          width: AppDimensions.getProportionateScreenWidth(150),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/profile_image.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: -AppDimensions.width16,
                          right: AppDimensions.width12,
                          child: GestureDetector(
                            onTap: () {
                              //todo: allow to change image
                              buildChangePhotoModal(context);
                            },
                            child: Container(
                              height:
                                  AppDimensions.getProportionateScreenHeight(
                                      50),
                              width:
                                  AppDimensions.getProportionateScreenWidth(50),
                              decoration: BoxDecoration(
                                  color: colorPrimary,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 5.px, color: Colors.white)),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                kHeight(AppDimensions.getProportionateScreenHeight(36)),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppDimensions.width16),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: personalInfo.length,
                      itemBuilder: (context, index) {
                        return PersonInfo(
                          title: personalInfo[index]['title'],
                          info: personalInfo[index]['info'],
                          infoIndex: index,
                          textController: textEditingController[index],
                          focusNode: textFieldFocusNode[index],
                          textFieldEnabled: fieldEnabled[index],
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.width16,
              vertical: AppDimensions.height16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: AppDimensions.getProportionateScreenWidth(150),
                  height: AppDimensions.height20 * 2.5,
                  child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 1.px, color: colorPrimary)),
                      child: Text(
                        'Log Out',
                        style: textButtonStyle,
                      ))),
              SizedBox(
                  width: AppDimensions.getProportionateScreenWidth(150),
                  height: AppDimensions.height20 * 2.5,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Delete Account',
                        style: textButtonStyle.copyWith(color: Colors.white),
                      ))),
            ],
          ),
        ));
  }
}
