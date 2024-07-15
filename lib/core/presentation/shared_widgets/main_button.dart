import 'package:flutter/material.dart';
import 'package:reddit_clone/core/presentation/shared_widgets/caption_text.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_border_radius.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_colors.dart';

class MainButton extends StatelessWidget {
  final Function()? onPressed;
  final String innerText;
  final FontWeight? innerTextWeight;
  final double? width;
  final double? elevation;
  final Color? color;
  final AlignmentDirectional? textAlign;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final double? height;
  final bool? setHeadLineSix;
  final EdgeInsetsGeometry? padding;
  const MainButton(
      {super.key,
      required this.innerText,
      required this.onPressed,
      this.innerTextWeight,
      this.setHeadLineSix,
      this.width,
      this.elevation,
      this.color,
      this.textAlign,
      this.borderRadius,
      this.textColor,
      this.padding,
      this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 100,
      height: height ?? 35,
      child: MaterialButton(
        onPressed: onPressed,
        elevation: elevation ?? 0.0,
        hoverElevation: elevation,
        color: AppColors.darkGreyColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? AppCircularRadius.radius30,
        ),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(10.0),
          child: Align(
            alignment: textAlign ?? AlignmentDirectional.center,
            child: CaptionText(
              text: innerText,
              fontSize: 10,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
