import 'package:flutter/material.dart';
import 'package:marlo_payment_app/utils/colors/colors.dart';

class FilterButton extends StatelessWidget {
  const FilterButton(
      {super.key, required this.name, required this.selected, this.onSelected});
  final String name;
  final bool selected;
  final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(name),
      selected: selected,
      onSelected: onSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      side: BorderSide.none,
      selectedColor: const Color.fromARGB(255, 185, 220, 252),
      backgroundColor: AppColors.kWhite,
      showCheckmark: false,
    );
  }
}
