import 'package:flutter/material.dart';
import 'package:marlo_payment_app/controller/transaction_controller.dart/transaction_controller.dart';
import 'package:marlo_payment_app/utils/colors/colors.dart';
import 'package:marlo_payment_app/utils/style/style.dart';
import 'package:marlo_payment_app/view/filter_screen/widget/filter_button.dart';
import 'package:marlo_payment_app/view/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class BottomSheetScreen {
  void filterBottomSheet(
    context,
  ) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(10),
          height: 700,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromARGB(185, 255, 255, 255),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Consumer<TransactionController>(
            builder: (context, value, child) {
              return SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextWidget(
                          name: "Filter",
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const TextWidget(
                            name: "clear",
                            fontSize: 18,
                            color: AppColors.kBlue,
                          ),
                        ),
                      ],
                    ),
                    AppSize.kHeight10,
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.kWhite,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextWidget(
                            name: "Money in and out . 2",
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          AppSize.kHeight10,
                          Row(
                            children: List.generate(
                              value.filterOptions.length,
                              (index) {
                                return FilterButton(
                                  name: value.filterOptions[index],
                                  selected: value.isSelected[index],
                                  onSelected: (p0) {
                                    value.buttonSelection(p0, index);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppSize.kHeight20,
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.kWhite,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextWidget(
                            name: "Statuses . 3",
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          AppSize.kHeight10,
                          Row(
                            children: List.generate(
                              value.statusOptions.length,
                              (index) {
                                return FilterButton(
                                  name: value.statusOptions[index],
                                  selected: value.isStatus[index],
                                  onSelected: (p0) {
                                    value.statusSelection(p0, index);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppSize.kHeight20,
                    Container(
                      // height: 500,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.kWhite,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Checkbox(
                                  checkColor: AppColors.kWhite,
                                  activeColor: AppColors.kBlue,
                                  side: const BorderSide(
                                      strokeAlign: 1, width: 1),
                                  value: false,
                                  onChanged: (data) {},
                                ),
                              ),
                              const Flexible(
                                child: TextWidget(
                                  name: "Currencies.169",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          AppSize.kHeight10,
                          ListView.separated(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Flexible(
                                    child: Checkbox(
                                      checkColor: AppColors.kWhite,
                                      activeColor: AppColors.kBlue,
                                      side: const BorderSide(
                                          strokeAlign: 1, width: 1),
                                      value: value.ischeckStatus[index],
                                      onChanged: (data) {
                                        value.checkSelection(data, index);
                                      },
                                    ),
                                  ),
                                  Flexible(
                                    flex: 3,
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: AssetImage(
                                          value.images[index],
                                        ),
                                      ),
                                      title: TextWidget(
                                        name: value.title[index],
                                      ),
                                      subtitle: TextWidget(
                                        name: value.subTitle[index],
                                        color:
                                            AppColors.kBlack.withOpacity(0.4),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount: value.title.length,
                            separatorBuilder: (context, index) {
                              return AppSize.kHeight10;
                            },
                          ),
                          AppSize.kHeight10,
                          TextButton(
                            onPressed: () {},
                            child: const TextWidget(
                              name: "See all accounts",
                              color: AppColors.kBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppSize.kHeight10,
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.kWhite,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextWidget(
                            name: "Amount",
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          AppSize.kHeight10,
                          Row(
                            children: [
                              Flexible(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Card(
                                    elevation: 0,
                                    color: const Color.fromARGB(
                                        255, 233, 242, 250),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                              name: "Minimum",
                                              color: AppColors.kBlack
                                                  .withOpacity(0.4)),
                                          const TextWidget(name: "0"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Card(
                                    elevation: 0,
                                    color: const Color.fromARGB(
                                        255, 233, 242, 250),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            name: "Maximum",
                                            color: AppColors.kBlack
                                                .withOpacity(0.4),
                                          ),
                                          const TextWidget(name: "5000"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    AppSize.kHeight10,
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 233, 242, 250),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const TextWidget(
                          name: "Cancel",
                          color: AppColors.kBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    AppSize.kHeight10,
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          value.filterApplied(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.kBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const TextWidget(
                          name: "Apply",
                          color: AppColors.kWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    AppSize.kHeight10,
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
