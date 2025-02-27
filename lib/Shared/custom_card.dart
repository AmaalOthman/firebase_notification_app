import 'package:flutter/material.dart';
import 'package:premium_store/Core/UI/color_schema.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final double? height,width;
  final Color? color;
  final double? elevation,radius,padding;
  final Color? border;
  final Function()? onTap;
  const CustomCard({Key? key,required this.child,this.height,this.width,this.color,this.elevation,this.border,this.onTap,this.radius,this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: ColorUtils.borderColor(context),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius??15)
        ),
        elevation: elevation??1,
        child: Container(
          padding: EdgeInsets.all(padding??0),
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius??15),
            border: border!=null?Border.all(color: border!,width: 0.7):null,
            //color: color??ColorSchema.whiteColor,
          ),
          child: child,
        ),
      ),
    );
  }
}