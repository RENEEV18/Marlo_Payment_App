import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marlo_payment_app/controller/transaction_controller.dart/transaction_controller.dart';
import 'package:marlo_payment_app/utils/colors/colors.dart';
import 'package:marlo_payment_app/utils/style/style.dart';
import 'package:marlo_payment_app/view/filter_screen/bottom_sheet.dart';
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
                        const Flexible(
                          flex: 7,
                          child: CupertinoSearchTextField(),
                        ),
                        Flexible(
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: AppColors.kBlack.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () {
                                /// here it goes to bottom sheet
                                BottomSheetScreen().filterBottomSheet(context);
                              },
                              child: Icon(
                                Icons.filter_alt,
                                color: AppColors.kBlack.withOpacity(0.3),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppSize.kHeight10,
                    Expanded(
                      child: value.isLoading == true
                          ? const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
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
                                      color:
                                          const Color.fromARGB(255, 4, 70, 124),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.arrow_outward,
                                        color: AppColors.kWhite,
                                      ),
                                    ),
                                  ),
                                  title: TextWidget(
                                    name: value
                                        .transactionList[index].description,
                                    overflow: TextOverflow.clip,
                                    maxLines: 1,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  subtitle: TextWidget(
                                    name: value.transactionList[index].createdAt
                                        .toString(),
                                  ),
                                  trailing: TextWidget(
                                    name:
                                        "\$${value.transactionList[index].amount}",
                                    fontSize: 16,
                                  ),
                                );
                              },
                              itemCount: value.transactionList.length,
                              separatorBuilder: (context, index) {
                                return AppSize.kHeight20;
                              },
                            ),
                    ),
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
