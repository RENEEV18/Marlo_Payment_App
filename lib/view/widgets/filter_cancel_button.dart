import 'package:flutter/material.dart';
import 'package:marlo_payment_app/utils/style/style.dart';
import 'package:marlo_payment_app/view/widgets/text_widget.dart';

class FilterCancelButton extends StatelessWidget {
  const FilterCancelButton({super.key, required this.name, this.onPressed});
  final String name;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 40,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 202, 228, 252),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          AppSize.kWidth10,
          TextWidget(name: name),
          AppSize.kWidth10,
          InkWell(
            onTap: onPressed,
            child: const Icon(
              Icons.cancel,
            ),
          ),
        ],
      ),
    );
  }
}
