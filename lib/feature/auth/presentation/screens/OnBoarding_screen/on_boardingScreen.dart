// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/core/common/common.dart';
import 'package:to_do_app/core/database/cache_helper.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widgets/custom_elevated_button.dart';
import 'package:to_do_app/feature/auth/data/model/on_boarding_model.dart';

import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../task/presentation/screens/home_screen/home_screen.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: PageView.builder(
            controller: controller,
            itemCount: OnBoardingModel.OnBoardingScreen.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      index != 2
                          ? CustomTextButton(
                              text: AppString.skip,
                              onPressed: () {
                                controller.jumpToPage(2);
                              })
                          : const SizedBox(
                              height: 50,
                            ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Image.asset(OnBoardingModel.OnBoardingScreen[index].imgPath),
                  const SizedBox(
                    height: 16,
                  ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                        activeDotColor: AppColors.primary,
                        spacing: 8,
                        // dotWidth: 27,
                        dotHeight: 8),
                  ),
                  const SizedBox(height: 50),
                  Text(OnBoardingModel.OnBoardingScreen[index].title,
                      style: Theme.of(context).textTheme.displayMedium),
                  const SizedBox(height: 42),
                  Text(OnBoardingModel.OnBoardingScreen[index].subTitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall),
                  const SizedBox(height: 65),
                  Row(
                    children: [
                      index != 0
                          ? CustomTextButton(
                              text: AppString.back,
                              onPressed: () {
                                controller.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.slowMiddle);
                              })
                          : Container(),
                      const Spacer(),
                      index != 2
                          ? CustomElevatedButton(
                              text: AppString.next,
                              onPressed: () {
                                controller.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.slowMiddle);
                              })
                          : CustomElevatedButton(
                              text: AppString.getStarted,
                              onPressed: () async {
                                await sl<CacheHelper>()
                                    .saveData(key: 'onBoarding', value: true)
                                    .then((value) {
                                  navigate(
                                      context: context,
                                      screen: const HomeScreen());
                                });
                              })
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
