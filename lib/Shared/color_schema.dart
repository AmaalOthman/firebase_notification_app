import 'package:flutter/material.dart';

class ColorUtils {
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
       Color(0xFFFF0000), 
       Color(0xFFB22222), 
       Color(0xFF8B0000),  
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const Color primaryColor = Color(0xFF8B0000);

  // Theme-based colors
  static Color backgroundColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? const Color(0xff221F20)
          : const Color(0xffffffff);

  static Color textColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? const Color(0xffffffff)
          : const Color(0xff000000);

  static Color hintTextColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? const Color(0xff7A7A7A)
          : const Color(0xff000000);

  static Color hintColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? const Color(0xff221F20)
          : const Color(0xff000000);

  static Color backgroundButtonColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? const Color(0xffC69E00)
          : const Color(0xffEFC20F);

  static Color shadowButtonColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? const Color(0xff363636)
          : const Color(0xffD9D9D9);

  static Color selectedColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? const Color(0xffB99D2F)
          : const Color(0xff000000);


  static Color iconColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? const Color(0xffffffff)
          :const Color(0xffffffff);
          //: const Color(0xff000000);

  static Color unselectedColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? Colors.grey.withOpacity(0.1)
          : Colors.grey.withOpacity(0.5);

  static Color inputBackgroundColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? const Color(0xff1A1A1A) 
          : const Color(0xffffffff);        

  static Color bottomNavBarBackgroundColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? const Color(0xff1A1A1A) 
          : const Color(0xffffffff); 

  static Color bottomNavBarSelectedItemColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ?  Color(0xFFB22222) 
          :  Color(0xffE91E63); 

  static Color bottomNavBarUnselectedItemColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? Colors.grey 
          : Colors.black54;       

  static Color borderColor(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark
        ? const Color(0xff707070) 
        : const Color(0xffDADADA); 

static Color errorColor(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark
        ? const Color(0xffE57373) 
        : const Color(0xffD32F2F); 

static Color focusedBorderColor(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark
        ? const Color(0xff707070) 
        : const Color(0xffDADADA);


  // static SystemUiOverlayStyle systemColor(BuildContext context) =>
  //     Theme.of(context).brightness == Brightness.dark
  //         ? const SystemUiOverlayStyle(
  //             statusBarColor: Colors.transparent,
  //             statusBarIconBrightness: Brightness.light,
  //           )
  //         : const SystemUiOverlayStyle(
  //             statusBarColor: Colors.transparent,
  //             statusBarIconBrightness: Brightness.dark,
  //           );
}




