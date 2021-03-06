import 'package:abdulahapp/layout/news_app/cubit.dart';
import 'package:abdulahapp/layout/news_app/states.dart';
import 'package:abdulahapp/shared/component/constants.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state){},
      builder: (context, state)
      {
        var list = NewsCubit.get(context).sports;

        return articleBuilder(list,context);
      },
    );
  }
}