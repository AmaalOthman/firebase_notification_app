import 'package:flutter/material.dart';
import 'package:premium_store/Core/UI/color_schema.dart';
import 'package:premium_store/Shared/custom_text.dart';

AppBar CustomAppBar(
    {
      required BuildContext context, 
      required title,
      Widget? leading,
      List<Widget>? actions,
      int elevation = 0,
      Widget? bottomChild,
      Color? backgroundColor,
      bottomChildHeight,
      leadingWidth,
      toolbarHeight,
      textColor, 
      }) {
        return AppBar(
         // backgroundColor: backgroundColor ?? ColorUtils.primaryColor,
          elevation: double.parse(elevation.toString()),
          toolbarHeight: toolbarHeight,
          title: title is Widget
              ? title
              : CustomText(
                  text: title,
                  fontSize: 18.0,
                  color: textColor ?? ColorUtils.textColor(context),
                  fontWeight: FontWeight.bold,
                ),
          centerTitle: true,
          leading: leading,
          // leadingWidth: leadingWidth??110,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: ColorUtils.primaryGradient ,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20), 
                  bottomRight: Radius.circular(20),
                ),
            ),
          ),
          actions: actions,
          bottom: bottomChild == null
              ? null
              : PreferredSize(
                  preferredSize: Size.fromHeight(bottomChildHeight ?? 120),
                  child: bottomChild,
                ),
        );
         
      }
