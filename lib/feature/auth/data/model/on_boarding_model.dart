import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_string.dart';
// import 'package:to_do_app/feature/auth/presentation/screens/OnBoarding_screen/on_boardingScreen.dart';

class OnBoardingModel {
  final String imgPath;
  final String title;
  final String subTitle;
  OnBoardingModel({
    required this.imgPath,
    required this.title,
    required this.subTitle,
  });
  // ignore: non_constant_identifier_names
  static List<OnBoardingModel> OnBoardingScreen = [
    OnBoardingModel(
      imgPath: AppAssets.pic1,
      title: AppString.onBoardingTitleOne,
      subTitle: AppString.onBoardingSubTitleOne,
    ),
    OnBoardingModel(
      imgPath: AppAssets.pic2,
      title: AppString.onBoardingTitleTwo,
      subTitle: AppString.onBoardingSubTitleTwo,
    ),
    OnBoardingModel(
      imgPath: AppAssets.pic3,
      title: AppString.onBoardingTitleThree,
      subTitle: AppString.onBoardingSubTitleThree,
    ),
  ];
}
