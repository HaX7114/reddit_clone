import 'package:flutter/cupertino.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_colors.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_font_families.dart';

class CaptionText extends StatelessWidget {
  final String text;
  final Color? color;
  final int? maxLines;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextOverflow? overFlowMode;
  final TextAlign? textAlign;
  const CaptionText({
    super.key,
    required this.text,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.fontSize,
    this.overFlowMode = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines ?? 2,
      style: TextStyle(
        fontFamily: AppFontFamilies.ralewayMedium,
        fontWeight: fontWeight ?? FontWeight.bold,
        overflow: overFlowMode,
        fontSize: fontSize ?? 12,
        color: color ?? AppColors.whiteColor,
      ),
    );
  }
}
