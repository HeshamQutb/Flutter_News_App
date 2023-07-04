import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/App/states.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());
  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeMode() {
    isDark = !isDark;
    emit(AppChangeModeState());
  }
}
