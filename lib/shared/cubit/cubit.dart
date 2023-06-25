import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business.dart';
import 'package:news_app/modules/science.dart';
import 'package:news_app/modules/sports.dart';
import 'package:news_app/shared/cubit/states.dart';

import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon:Icon(Icons.business_center),
        label: 'Business'),
    const BottomNavigationBarItem(
        icon:Icon(Icons.sports),
        label: 'Sports'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.science),
        label: 'Science'),
  ];

  List<Widget> screen = [
     const BusinessScreen(),
     const SportsScreen(),
     const ScienceScreen(),
  ];

  void navBarChange(int index){
    currentIndex = index;
    emit(NewsNavBarBarChangeState());
  }


  List<dynamic> business=[];
  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    if(business.isEmpty){
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country':'eg',
        'category':'business',
        'apiKey':'4a6a9d4a13b14612a805959fe8dc8830',
      },
      ).then((value)
      {
        business=value?.data['articles'];
        print(business[0]['title']);

        emit(NewsGetBusinessSuccessState());
      }).catchError((error)
      {
        print(error.toString());

        emit(NewsGetBusinessErrorState(error));
      });
    }
    else{
      emit(NewsGetBusinessSuccessState());
    }
  }


  List<dynamic> sports=[];
  void getSports(){
    emit(NewsGetSportsLoadingState());
    if(sports.isEmpty){
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country':'eg',
        'category':'Sports',
        'apiKey':'4a6a9d4a13b14612a805959fe8dc8830',
      },
      ).then((value)
      {
        sports=value?.data['articles'];
        print(sports[0]['title']);

        emit(NewsGetSportsSuccessState());
      }).catchError((error)
      {
        print(error.toString());

        emit(NewsGetSportsErrorState(error));
      });
    }
    else{
      emit(NewsGetSportsSuccessState());
    }
  }


  List<dynamic> science=[];
  void getScience(){
    emit(NewsGetScienceLoadingState());
    if(science.isEmpty){
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country':'eg',
        'category':'science',
        'apiKey':'4a6a9d4a13b14612a805959fe8dc8830',
      },
      ).then((value)
      {
        science=value?.data['articles'];
        print(science[0]['title']);

        emit(NewsGetScienceSuccessState());
      }).catchError((error)
      {
        print(error.toString());

        emit(NewsGetScienceErrorState(error));
      });
    }
    else{
      emit(NewsGetScienceSuccessState());
    }

  }



}
