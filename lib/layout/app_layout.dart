import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haram_task/style/colors.dart';

import '../cubit/cubit/cubit.dart';
import '../cubit/states/states.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, HaramState>(
        builder: (BuildContext context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            body: cubit.screen[cubit.currentIndex].view,
            bottomNavigationBar: Container(
              color: Colors.white,
              height: 60,
              child: Row(
                  children: cubit.screen
                      .map((e) => Expanded(
                            child: InkWell(
                              onTap: () => cubit.changeBottomNav(e.id),
                              child: Center(
                                child: Image.asset(
                                    'assets/images/${e.text}.png',
                                    color: cubit.currentIndex == e.id
                                        ? AppColor.mainColor
                                        : Colors.grey,
                                    height: 25),
                              ),
                            ),
                          ))
                      .toList()),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: AppColor.mainColor,
              child: Image.asset('assets/images/newmsg.png', height: 25),
            ),
          );
        },
      ),
    );
  }
}

//BottomNavigationBar(
//                 backgroundColor: AppColor.white,
//                 unselectedItemColor: AppColor.nonactive,
//                 selectedItemColor: AppColor.mainColor,
//                 elevation: 20,
//                 type: BottomNavigationBarType.fixed,
//                 currentIndex: cubit.currentIndex,
//                 onTap: (int index) {
//                   cubit.changeBottomNav(index);
//                 },
//                 items:  [
//                   BottomNavigationBarItem(
//                       icon: Image.asset('assets/images/chat.png'), label: ''),
//                   BottomNavigationBarItem(
//                       icon: Icon(Icons.access_time_filled), label: ''),
//                   BottomNavigationBarItem(
//                       icon: Icon(Icons.wifi_calling_3), label: ''),
//                   BottomNavigationBarItem(
//                       icon: Icon(Icons.person_pin), label: ''),
//                 ])
