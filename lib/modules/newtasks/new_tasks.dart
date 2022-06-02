import 'package:abdulahapp/shared/component/constants.dart';
import 'package:abdulahapp/shared/components/constants.dart';
import 'package:abdulahapp/shared/cubit/cubit.dart';
import 'package:abdulahapp/shared/cubit/states.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTasks extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

     return BlocConsumer<AppCubit, AppStates>(

         listener: (context,state)
         {

         }
         ,
       builder: (context, state)
       {

         var tasks = AppCubit.get(context).newtasks;
         return ConditionalBuilder(
             condition: tasks.length > 0,
             builder: (context) => ListView.separated(
                 itemBuilder: (context,index)=>buildTaskItem(tasks[index],context),
                 separatorBuilder: (context,index)=>Container(
                   width: double.infinity,
                   color: Colors.grey[300],
                   height: 1,
                 ),
                 itemCount: tasks.length
             ),
           fallback: (context)=> Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(
                   Icons.menu,
                   color: Colors.grey,
                   size: 100,
                 ),
                 Text(
                     'No tasks yet, Please add some tasks',
                   style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),

                 )
               ],
             ),
           ),
         );
       },
     );
  }
}
