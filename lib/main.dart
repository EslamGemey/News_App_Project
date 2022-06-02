import 'package:abdulahapp/Revision/Expanded.dart';
import 'package:abdulahapp/Revision/Revision.dart';
import 'package:abdulahapp/layout/news_app/news_layout.dart';
import 'package:abdulahapp/layout/news_app/states.dart';
import 'package:abdulahapp/modules/bmi/BMICALCULATOR.dart';
import 'package:abdulahapp/modules/bmi_result/BMI_Result_Screen.dart';
import 'package:abdulahapp/modules/home/Home_Screen.dart';
import 'package:abdulahapp/modules/login/Login_Screen.dart';
import 'package:abdulahapp/modules/messenger/MessengerScreen.dart';
import 'package:abdulahapp/modules/user/Users_Screen.dart';
import 'package:abdulahapp/modules/counter/counter.dart';
import 'package:abdulahapp/shared/bloc_observer.dart';
import 'package:abdulahapp/shared/cubit/cubit.dart';
import 'package:abdulahapp/shared/network/local/cach_helper.dart';
import 'package:abdulahapp/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Revision/Revisionuserscreen.dart';
import 'layout/news_app/cubit.dart';
import 'layout/todo_app/todo_layout.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
 await  CachHelper.init();

 bool isDark = CachHelper.getBoolean(key: 'isDark');

  runApp(MyApp(isDark));
}
// class
class MyApp extends StatelessWidget{


  final bool isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers:
      [
        BlocProvider(
            create: (BuildContext context)=>AppCubit()..changeAppMode(fromShared: isDark),
        ),
        BlocProvider(
            create: (BuildContext context)=> NewsCubit()..getBusiness(),
        )
      ],

      child: BlocConsumer< NewsCubit, NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
              debugShowCheckedModeBanner: false,

              theme: ThemeData(
                  primarySwatch: Colors.deepOrange,
                  floatingActionButtonTheme: FloatingActionButtonThemeData(
                      backgroundColor: Colors.deepOrange
                  ),
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                    iconTheme: IconThemeData(
                        color: Colors.black
                    ),
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white10,
                        statusBarIconBrightness: Brightness.dark
                    ),
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey,
                    elevation: 20.0,
                    backgroundColor: Colors.white,
                  ),
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black
                      )
                  )
              ),

              darkTheme: ThemeData(
                  primarySwatch: Colors.deepOrange,
                  floatingActionButtonTheme: FloatingActionButtonThemeData(
                      backgroundColor: Colors.deepOrange
                  ),
                  scaffoldBackgroundColor: HexColor('333739'),
                  appBarTheme: AppBarTheme(
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                    iconTheme: IconThemeData(
                        color: Colors.white
                    ),
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: HexColor('333739'),
                        statusBarIconBrightness: Brightness.light
                    ),
                    backgroundColor: HexColor('333739'),
                    elevation: 0.0,
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey,
                    elevation: 20.0,
                    backgroundColor: HexColor('333739'),
                  ),
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                      )
                  )
              ),

              themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
              home: NewsLayout()
          );

        },
      ),
    );


  }

}