import 'package:abdulahapp/shared/cubit/cubit.dart';
import 'package:abdulahapp/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/component/constants.dart';

class DoneTasks extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(

      listener: (context,state)
      {

      }
      ,
      builder: (context, state)
      {

        var tasks = AppCubit.get(context).donetasks;

        return tasksbuilder(
            tasks: tasks
        );
      },
    );
  }
}
