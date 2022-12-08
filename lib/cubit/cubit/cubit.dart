import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haram_task/modules/calls/view.dart';
import 'package:haram_task/modules/chats/models/tab_model.dart';
import 'package:haram_task/modules/chats/screens/view.dart';
import 'package:haram_task/modules/clock/view.dart';
import 'package:haram_task/modules/profile/view.dart';


import '../states/states.dart';

class AppCubit extends Cubit<HaramState> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  changeBottomNav(index) {
    print(index);
    currentIndex = index;
    emit(ChangeNavBottomState());
  }

  List<TabModel> screen = const [
    TabModel(id: 0, text: 'chat', view: ChatHome()),
    TabModel(id: 1, text: 'time', view: ClockHome()),
    TabModel(id: 2, text: 'call1', view: CallHome()),
    TabModel(id: 3, text: 'prof', view: ProfileHome()),
  ];
}
