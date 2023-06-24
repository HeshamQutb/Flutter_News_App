import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business.dart';
import 'package:news_app/modules/science.dart';
import 'package:news_app/modules/setting.dart';
import 'package:news_app/modules/sports.dart';
import 'package:news_app/shared/cubit/states.dart';

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
    const BottomNavigationBarItem(
        icon:Icon(Icons.settings),
        label: 'Setting'),
  ];

  List<Widget> screen = [
     const BusinessScreen(),
     const SportsScreen(),
     const ScienceScreen(),
     const SettingScreen()
  ];

  void navBarChange(int index)
  {
    currentIndex = index;
    emit(NewsNavBarBarChangeState());
  }





}
