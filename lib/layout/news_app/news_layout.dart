import 'package:abdulahapp/layout/news_app/cubit.dart';
import 'package:abdulahapp/layout/news_app/states.dart';
import 'package:abdulahapp/modules/search/search_screen.dart';
import 'package:abdulahapp/shared/component/constants.dart';
import 'package:abdulahapp/shared/cubit/cubit.dart';
import 'package:abdulahapp/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context)=> NewsCubit()..getBusiness()..getSports()..getScience(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state){},
        builder: (context, state)
        {
          var cubit = NewsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text(
                  'News App'
              ),
              actions: [
                IconButton(
                    onPressed: ()
                    {
                      navigateTo(context, SearchScreen());

                    },
                    icon: Icon(Icons.search)
                ),
                IconButton(
                    onPressed: (){
                      AppCubit.get(context).changeAppMode();
                    },
                    icon: Icon(
                      Icons.brightness_4_outlined
                    )
                )
              ],
            ),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: (){},
            //   child: Icon(
            //     Icons.add
            //   ),
            // ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(

              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItems,
            ),
          );
        },
      )
    );
  }
}
