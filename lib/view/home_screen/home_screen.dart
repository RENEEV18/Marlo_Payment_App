import 'package:flutter/material.dart';
import 'package:marlo_payment_app/controller/home_controller/home_controller.dart';
import 'package:marlo_payment_app/controller/token_controller/token_controller.dart';
import 'package:marlo_payment_app/utils/colors/colors.dart';
import 'package:marlo_payment_app/utils/style/style.dart';
import 'package:marlo_payment_app/view/widgets/listview_builder.dart';
import 'package:marlo_payment_app/view/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TokenController>(context, listen: false).getToken(context);
    });
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.kOrange,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: TextWidget(
                name: "jb".toUpperCase(),
                fontWeight: FontWeight.bold,
                color: AppColors.kWhite,
                fontSize: 20,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: AppColors.kBlue,
              size: 28,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Consumer<HomeController>(
          builder: (context, value, child) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 180,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ListViewWidget(
                            values: value.values[index],
                            name: value.names[index],
                            width: 160,
                            alignment: CrossAxisAlignment.start,
                            mainAlignment: MainAxisAlignment.start,
                            widget: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                value.images[index],
                              ),
                            ),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          );
                        },
                        itemCount: value.values.length,
                        separatorBuilder: (context, index) {
                          return AppSize.kWidth10;
                        },
                      ),
                    ),
                    AppSize.kHeight20,
                    TextWidget(
                      name: "To do 4",
                      fontSize: 20,
                      color: AppColors.kBlack.withOpacity(
                        0.4,
                      ),
                      fontWeight: FontWeight.bold,
                    ),
                    AppSize.kHeight10,
                    SizedBox(
                      height: 168,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ListViewWidget(
                            values: value.data[index],
                            fontWeight: FontWeight.w400,
                            name: "",
                            width: 180,
                            textAlign: TextAlign.center,
                            alignment: CrossAxisAlignment.center,
                            mainAlignment: MainAxisAlignment.center,
                            widget: CircleAvatar(
                              radius: 25,
                              backgroundColor: value.backgroundColor[index],
                              child: Icon(
                                value.icons[index],
                                color: value.iconColor[index],
                                size: 30,
                              ),
                            ),
                            fontSize: 15,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: value.gradientList[index],
                            ),
                          );
                        },
                        itemCount: value.data.length,
                        separatorBuilder: (context, index) {
                          return AppSize.kWidth10;
                        },
                      ),
                    ),
                    AppSize.kHeight30,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          name: "All transactions",
                          fontWeight: FontWeight.bold,
                          color: AppColors.kBlack.withOpacity(0.4),
                          fontSize: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            value.toTransaction(context);
                          },
                          child: const TextWidget(
                            name: "See all",
                            color: AppColors.kBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    ListView.separated(
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
                            child: Center(
                              child: Icon(
                                value.iconsTrans[index],
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
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
