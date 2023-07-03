import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marlo_payment_app/controller/transaction_controller.dart/transaction_controller.dart';
import 'package:marlo_payment_app/utils/colors/colors.dart';
import 'package:marlo_payment_app/utils/style/style.dart';
import 'package:marlo_payment_app/view/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                          child: Icon(
                            Icons.filter_alt,
                            color: AppColors.kBlack.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppSize.kHeight10,
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Container(
                            width: 55,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 4, 70, 124),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_outward,
                                color: AppColors.kWhite,
                              ),
                            ),
                          ),
                          title: const TextWidget(
                            name: "Rent",
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          subtitle: const TextWidget(
                            name: "Sat.16 jul.9.00 pm",
                          ),
                          trailing: const TextWidget(
                            name: "-\$850.00",
                            fontSize: 16,
                          ),
                        );
                      },
                      itemCount: 10,
                      separatorBuilder: (context, index) {
                        return AppSize.kHeight20;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
