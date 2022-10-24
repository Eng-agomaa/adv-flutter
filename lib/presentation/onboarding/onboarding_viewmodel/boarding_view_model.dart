import 'dart:async';

import 'package:advanced_flutter/domain/models.dart';
import 'package:advanced_flutter/presentation/base/base_model_view.dart';
import 'package:advanced_flutter/presentation/resources/assets_manager.dart';
import 'package:advanced_flutter/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController _streamController = StreamController<SliderViewObject>();

  late final List<SliderObject> _list;
  int _currentIndex = 0;
  @override

  void dispose() {
    _streamController.close();
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
    _list = _getSliderData();
    _postDataToView ();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex  ;
    if ( nextIndex == _list.length){
      nextIndex = 0 ;
    }
    return nextIndex ;
  }

  @override
  int goPrevious() {
    int previousIndex = -- _currentIndex  ;
    if ( previousIndex == -1){
      previousIndex = _list.length -1 ;
    }
    return previousIndex ;
  }

  @override
  void onPageChange(int index) {
    _currentIndex = index;
  }

  @override
  // TODO: implement inputSlideViewObject
  Sink get inputSlideViewObject => _streamController.sink;

  @override
  // TODO: implement outputSlideViewObject
  Stream <SliderViewObject>get outputSlideViewObject => _streamController.stream.map((sliderViewObject) => sliderViewObject);
  void  _postDataToView (){
    inputSlideViewObject.add(SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
  List<SliderObject> _getSliderData() =>
      [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onBoardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubTitle2, ImageAssets.onBoardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubTitle3, ImageAssets.onBoardingLogo3),
        SliderObject(AppStrings.onBoardingTitle4,
            AppStrings.onBoardingSubTitle4, ImageAssets.onBoardingLogo4),
      ];
}

abstract class OnBoardingViewModelInputs {
  void goNext();

  void goPrevious();

  void onPageChange(int index);

  Sink get inputSlideViewObject;
}

abstract class OnBoardingViewModelOutputs {
  Stream <SliderViewObject> get outputSlideViewObject;
}
