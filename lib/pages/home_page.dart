import 'dart:math';
import 'package:english_card/models/english_today.dart';
import 'package:english_card/values/app_assets.dart';
import 'package:english_card/values/app_colors.dart';
import 'package:english_card/values/app_styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  List<EnglishToday> words = [];

  List<int> fixedListRamdom({int len = 1, int max = 120, int min = 1}) {
    if (len > max || len < min) {
      return [];
    }
    List<int> newList = [];

    Random random = Random();
    int count = 1;
    while (count <= len) {
      int val = random.nextInt(max);
      if (newList.contains(val)) {
        continue;
      } else {
        newList.add(val);
        count++;
      }
    }
    return newList;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.secondColor,
        appBar: AppBar(
          backgroundColor: AppColors.secondColor,
          elevation: 0,
          title: Text(
            "English today",
            style:
                AppStyles.h2.copyWith(color: AppColors.textColor, fontSize: 36),
          ),
          leading: InkWell(
            onTap: () {},
            child: Image.asset(AppAssets.menu),
          ),
        ),
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Container(
                height: size.height * 0.1,
                padding: EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.centerLeft,
                child: Text(
                  "“It is amazing how complete is the delusion that beauty is goodness.”",
                  style: AppStyles.h6
                      .copyWith(color: AppColors.textColor, fontSize: 12),
                ),
              ),
              Container(
                height: size.height * 2 / 3,
                child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                alignment: Alignment.centerRight,
                                child: Image.asset(AppAssets.heart)),
                            RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                text: const TextSpan(
                                    text: 'B',
                                    style: TextStyle(
                                        fontFamily: FontFamily.sen,
                                        fontSize: 89,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        shadows: [
                                          BoxShadow(
                                              color: Colors.black38,
                                              offset: Offset(3, 6),
                                              blurRadius: 6)
                                        ]),
                                    children: [
                                      TextSpan(
                                        text: "eautiful",
                                        style: TextStyle(
                                            fontFamily: FontFamily.sen,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 56,
                                            color: Colors.white),
                                      ),
                                    ])),
                            Padding(
                              padding: const EdgeInsets.only(top: 24.0),
                              child: Text(
                                "“Think of all the beauty still left around you and be happy.”",
                                style:
                                    AppStyles.h4.copyWith(color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),

              // Indicator
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                height: 12,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) =>
                      buildIndicator(index == _currentIndex, size),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Image.asset(AppAssets.exchange),
          backgroundColor: AppColors.primaryColor,
        ));
  }

  Widget buildIndicator(bool isActive, Size size) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: isActive ? size.width * 1 / 5 : 24,
      decoration: BoxDecoration(
          color: isActive ? AppColors.primaryColor : AppColors.secondColor,
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
                color: Colors.black38, offset: Offset(2, 3), blurRadius: 3)
          ]),
    );
  }
}
