import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/App/states.dart';

import '../../network/local/cache_helper.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());
  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeMode({bool? fromShared}) {
    if(fromShared != null){
      isDark = fromShared;
      emit(AppChangeModeState());
    }else{
      isDark = !isDark;
      CacheHelper.setBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }

  }
}
