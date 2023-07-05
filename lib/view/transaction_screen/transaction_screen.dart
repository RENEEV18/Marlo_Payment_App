import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marlo_payment_app/controller/transaction_controller.dart/transaction_controller.dart';
import 'package:marlo_payment_app/utils/colors/colors.dart';
import 'package:marlo_payment_app/utils/style/style.dart';
import 'package:marlo_payment_app/view/filter_screen/bottom_sheet.dart';
import 'package:marlo_payment_app/view/widgets/filter_cancel_button.dart';
import 'package:marlo_payment_app/view/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TransactionController>(context, listen: false)
          .getTransaction(context);
    });
    return Consumer<TransactionController>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                value.goBack(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.download,
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () {
                return value.getTransaction(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      name: "Transaction",
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                    AppSize.kHeight20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 7,
                          child: CupertinoSearchTextField(
                            onChanged: (data) {
                              value.search(data, context);
                            },
                          ),
                        ),
                        Flexible(
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: value.finalList.isNotEmpty
                                  ? const Color.fromARGB(255, 202, 228, 252)
                                  : AppColors.kBlack.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () {
                                /// here it goes to bottom sheet
                                BottomSheetScreen().filterBottomSheet(context);
                                value.clearList();
                              },
                              child: Icon(
                                Icons.filter_alt,
                                color: value.finalList.isNotEmpty
                                    ? AppColors.kBlue
                                    : AppColors.kBlack.withOpacity(0.4),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    value.finalList.isNotEmpty
                        ? AppSize.kHeight20
                        : AppSize.kHeight0,
                    value.finalList.isNotEmpty
                        ? SizedBox(
                            height: 40,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return FilterCancelButton(
                                  name: value.finalList[index],
                                  onPressed: () {
                                    value.clear(index, context);
                                  },
                                );
                              },
                              itemCount: value.finalList.length,
                              separatorBuilder: (context, index) {
                                return AppSize.kWidth10;
                              },
                            ),
                          )
                        : AppSize.kHeight10,
                    Expanded(
                        child: value.isLoading == true
                            ? const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : value.transactionList.isEmpty
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Image(
                                          image: AssetImage(
                                              "assets/images/Screenshot_from_2023-07-05_15-54-24-removebg-preview.png"),
                                          height: 90,
                                        ),
                                        TextWidget(
                                          name: "No results found",
                                          fontWeight: FontWeight.bold,
                                          color:
                                              AppColors.kBlack.withOpacity(0.4),
                                        ),
                                        AppSize.kHeight20,
                                      ],
                                    ),
                                  )
                                : ListView.separated(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        onTap: () {},
                                        leading: Container(
                                          width: 55,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 4, 70, 124),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.arrow_outward,
                                              color: AppColors.kWhite,
                                            ),
                                          ),
                                        ),
                                        title: TextWidget(
                                          name: value.finalList.isNotEmpty
                                              ? value
                                                  .filterList[index].description
                                              : value.transactionList.isEmpty
                                                  ? value.transactionList[index]
                                                      .description
                                                  : value.transactionList[index]
                                                      .description,
                                          overflow: TextOverflow.clip,
                                          maxLines: 1,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                        subtitle: TextWidget(
                                          overflow: TextOverflow.ellipsis,
                                          name: value.finalList.isNotEmpty
                                              ? DateFormat('EEE d MMM h:mm a')
                                                  .format(value
                                                      .filterList[index]
                                                      .createdAt)
                                                  .toString()
                                              : value.transactionList.isEmpty
                                                  ? DateFormat(
                                                          'EEE d MMM h:mm a')
                                                      .format(value
                                                          .transactionList[
                                                              index]
                                                          .createdAt)
                                                      .toString()
                                                  : DateFormat(
                                                          'EEE d MMM h:mm a')
                                                      .format(value
                                                          .transactionList[
                                                              index]
                                                          .createdAt)
                                                      .toString(),
                                        ),
                                        trailing: TextWidget(
                                          maxLines: 1,
                                          name: value.finalList.isNotEmpty
                                              ? "\$${value.filterList[index].amount}"
                                              : value.transactionList.isEmpty
                                                  ? "\$${value.transactionList[index].amount}"
                                                  : "\$${value.transactionList[index].amount}",
                                          fontSize: 16,
                                        ),
                                      );
                                    },
                                    itemCount: value.finalList.isNotEmpty
                                        ? value.filterList.length
                                        : value.transactionList.length,
                                    separatorBuilder: (context, index) {
                                      return AppSize.kHeight20;
                                    },
                                  )),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
