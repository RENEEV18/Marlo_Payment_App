import 'package:flutter/material.dart';
import 'package:marlo_payment_app/utils/colors/colors.dart';
import 'package:marlo_payment_app/utils/style/style.dart';
import 'package:marlo_payment_app/view/widgets/text_widget.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    super.key,
    required this.values,
    required this.name,
    required this.width,
    required this.alignment,
    required this.mainAlignment,
    required this.widget,
    this.fontWeight,
    this.fontSize,
    this.textAlign,
    this.gradient,
  });
  final String values;
  final String name;
  final double width;
  final CrossAxisAlignment alignment;
  final MainAxisAlignment mainAlignment;
  final Widget widget;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  final Gradient? gradient;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        gradient: gradient,
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: mainAlignment,
          crossAxisAlignment: alignment,
          children: [
            widget,
            AppSize.kHeight20,
            TextWidget(
              name: values,
              fontWeight: fontWeight,
              fontSize: fontSize,
              textAlign: textAlign,
            ),
            AppSize.kHeight5,
            TextWidget(
              name: name,
              color: AppColors.kBlack.withOpacity(0.4),
              fontSize: 18,
            ),
          ],
        ),
      ),
    );
  }
}
