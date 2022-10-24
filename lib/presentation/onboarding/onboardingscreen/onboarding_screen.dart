import 'package:advanced_flutter/presentation/onboarding/onboarding_viewmodel/boarding_view_model.dart';
import 'package:advanced_flutter/presentation/resources/assets_manager.dart';
import 'package:advanced_flutter/presentation/resources/color_manager.dart';
import 'package:advanced_flutter/presentation/resources/constants_manager.dart';
import 'package:advanced_flutter/presentation/resources/routes.dart';
import 'package:advanced_flutter/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../domain/models.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
 final OnBoardingViewModel _viewModel = OnBoardingViewModel();

 _bind(){
  _viewModel.start();
 }// if appear error I will Remove Final

@override
  void initState() {
    _bind();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _viewModel.outputSlideViewObject,
        builder: (context,snapshot){
        return _getContentWidget(snapshot.data);
        });
  }
   Widget _getContentWidget (SliderViewObject? sliderViewObject){
   if(sliderViewObject == null){
     return Container();
   }
   return Scaffold(
     backgroundColor: ColorManager.white,
     appBar: AppBar(
       elevation: AppSize.s0,
       systemOverlayStyle: SystemUiOverlayStyle(
           statusBarColor: ColorManager.white,
           statusBarBrightness: Brightness.dark),
     ),
     body: PageView.builder(
         controller: _pageController,
         itemCount: sliderViewObject.numOfSlider,
         onPageChanged: (index) {
         _viewModel.onPageChange(index);
         },
         itemBuilder: (context, index) {
           return OnBoardingPage(sliderViewObject.sliderObject);
         }),
     bottomSheet: Container(
       color: ColorManager.white,
       child: Column(
         mainAxisSize: MainAxisSize.min,
         children: [
           Align(
             alignment: Alignment.centerRight,
             child: TextButton(onPressed: () {
               Navigator.pushReplacementNamed(context, Routes.loginRoute);
             },
                 child:  Text(AppStrings.skip, textAlign: TextAlign.end,
                   style: Theme.of(context).textTheme.titleMedium,
                 )),
           ),
           _getBottomSheetWidget(sliderViewObject),

         ],
       ),
     ),
   );
   }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          Padding(
            padding: const EdgeInsets.all(AppSize.s8),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrowIc),
              ),
              onTap: () {
                _pageController.animateToPage(_viewModel.goPrevious(),
                  duration: const Duration(
                      milliseconds: AppConstants.slideTimeAnimation),
                  curve: Curves.bounceInOut,);
              },
            ),
          ),
          // circle center
          Row(
            children: [
              for( int i = 0; i < sliderViewObject.numOfSlider; i++)
                Padding(padding: const EdgeInsets.all(AppPadding.p14),
                    child: _getProperCircle(i,sliderViewObject.currentIndex))
            ],
          ),

          // right arrow
          Padding(
            padding: const EdgeInsets.all(AppSize.s8),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightArrowIc),
              ),
              onTap: (){
                _pageController.animateToPage(_viewModel.goNext(), duration: const Duration(milliseconds: AppConstants.slideTimeAnimation),
                    curve: Curves.bounceInOut);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _getProperCircle(int index,currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc);
    }
  }
  @override
  void dispose() {
_viewModel.dispose();
super.dispose();
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);
  final SliderObject _sliderObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme
                .of(context)
                .textTheme
                .headlineMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme
                .of(context)
                .textTheme
                .bodyLarge,
          ),
        ),
        const SizedBox(
          height: AppSize.s40,
        ),
        SvgPicture.asset(_sliderObject.image),
      ],
    );
  }

}

