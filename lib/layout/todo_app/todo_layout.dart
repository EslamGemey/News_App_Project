
import 'package:abdulahapp/shared/component/constants.dart';
import 'package:abdulahapp/modules/archived_tasks/archivedtask.dart';
import 'package:abdulahapp/modules/done_tasks/donetask.dart';
import 'package:abdulahapp/modules/newtasks/new_tasks.dart';
import 'package:abdulahapp/shared/components/constants.dart';
import 'package:abdulahapp/shared/cubit/cubit.dart';
import 'package:abdulahapp/shared/cubit/states.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class home extends StatelessWidget
{
  var Scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();



  var titlecontroller = TextEditingController();
  var timecontroller = TextEditingController();
  var datecontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=> AppCubit()..createDatabase(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context,AppStates state){
            if(state is InsertState)
            {
              Navigator.pop(context);
            }
          },
          builder: (BuildContext context,AppStates state){
            AppCubit cubit = AppCubit.get(context);

            return Scaffold(
              key: Scaffoldkey,

              appBar: AppBar(
                title: Text(
                  '${cubit.title[cubit.currentindex]}',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),

                ),
              ),
              body: ConditionalBuilder(
                condition: true,
                builder: (context)=> cubit.Screens[cubit.currentindex],
                fallback:(context)=> Center(child: CircularProgressIndicator()) ,
              ),
              floatingActionButton: FloatingActionButton(
                // start my work today

                onPressed: () async
                {
                  if(cubit.isbottomshown)
                  {
                    if(formkey.currentState.validate())
                    {
                      cubit.insertTodatabase(
                          title: titlecontroller.text,
                          date: datecontroller.text,
                          time: timecontroller.text
                      );

                      // insertTodatabase(
                      //     title: titlecontroller.text,
                      //     date: datecontroller.text,
                      //     time: timecontroller.text
                      // ).then((value){
                      //   Navigator.pop(context);
                      //   isbottomshown = false;
                      //   // setState(() {
                      //   //   changeicon = Icons.edit;
                      //   // });
                      // });
                    }

                  }else
                  {
                    Scaffoldkey.currentState.showBottomSheet((context) => Container(
                      color: Colors.grey[200],
                      padding: EdgeInsets.all(20.0),
                      child: Form(
                        key: formkey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children:
                          [
                            //title form
                            defaultformfield(
                                controller: titlecontroller,
                                type: TextInputType.text,
                                Validate: (String value)
                                {
                                  if(value.isEmpty)
                                  {
                                    return 'title must not be empty';
                                  }
                                  return null;

                                },
                                LabelText: 'Task Title',
                                iconprefix: Icons.title
                            ),

                            SizedBox(
                              height: 15,
                            ),

                            //time form
                            defaultformfield(
                              controller: timecontroller,
                              type: TextInputType.datetime,
                              Validate: (String value)
                              {
                                if(value.isEmpty)
                                {
                                  return 'time must not be empty';
                                }
                                return null;

                              },
                              ontap: ()
                              {
                                showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now()
                                ).then((value){
                                  timecontroller.text = value.format(context).toString();
                                  print(value.format(context).toString());

                                });


                              },
                              LabelText: 'Task Time',
                              iconprefix: Icons.watch_later_outlined,
                            ),

                            SizedBox(
                              height: 15,
                            ),

                            // date form
                            defaultformfield(
                              controller: datecontroller,
                              type: TextInputType.datetime,
                              Validate: (String value)
                              {
                                if(value.isEmpty)
                                {
                                  return 'date must not be empty';
                                }
                                return null;

                              },
                              ontap: ()
                              {
                                showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate:DateTime.now(),
                                    lastDate: DateTime(2022, 1, 1)
                                ).then((value)
                                {
                                  datecontroller.text = DateFormat.yMMMd().format(value);
                                  print(DateFormat.yMMMd().format(value));
                                });
                              },
                              LabelText: 'Task Date',
                              iconprefix: Icons.calendar_today_outlined,
                            ),

                          ],
                        ),
                      ),
                    )
                    ).closed.then((value)
                    {
                      cubit.ChangeBottomSheetState(
                          IsShow: false,
                          Changeicon: Icons.edit
                      );


                    });

                    cubit.ChangeBottomSheetState(
                        IsShow: true,
                        Changeicon: Icons.add
                    );
                  }
                },


                child: Icon(
                    cubit.changeicon
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: AppCubit.get(context).currentindex,
                onTap: (index){
                  AppCubit.get(context).changIndex(index);
                },

                items:
                [
                  BottomNavigationBarItem(
                      icon: Icon(
                          Icons.menu
                      ),
                      label: 'Tasks'
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                          Icons.done
                      ),
                      label: 'Done'
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                          Icons.archive_outlined
                      ),
                      label: 'Archived'
                  ),
                ],
              ),

            );
          },
        )
    );
  }

  // Future<String> getname() async
  // {
  //   return 'Eslam Gamal';
  // }


}


