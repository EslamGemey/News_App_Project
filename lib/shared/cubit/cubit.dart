import 'package:abdulahapp/modules/archived_tasks/archivedtask.dart';
import 'package:abdulahapp/modules/done_tasks/donetask.dart';
import 'package:abdulahapp/modules/newtasks/new_tasks.dart';
import 'package:abdulahapp/shared/components/constants.dart';
import 'package:abdulahapp/shared/cubit/states.dart';
import 'package:abdulahapp/shared/network/local/cach_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppIntialState());

  static AppCubit get(context)=> BlocProvider.of(context);


  int currentindex=0;

  List<Widget> Screens = [
    NewTasks(),
    DoneTasks(),
    ArchivedTasks()
  ];


  List<String> title = [
    'New Task',
    'Done Task',
    'Archived Task'
  ];

  void changIndex(int index){
    currentindex = index;
    emit(ChangeState());
  }

  Database database;
  List<Map> newtasks = [];
  List<Map> donetasks = [];
  List<Map> archivedtasks = [];

  void createDatabase()
  {
     openDatabase(
        'todo.db',
        version: 1,
        onCreate: (database,version)
        {
          print('database is created');
          //  create table tasks
          database.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)').then((value)
          {
            print('Table is created');
          }).catchError((Error){
            print('Error when creating table!!!!!${Error.toString()}');
          });
        },

        onOpen: (database)
        {
           getDataFromDatabase(database);
          print('database is opened');
        }
    ).then((value) {
      database = value;
      emit(CreateState());
     });
  }

   insertTodatabase
      ({
    @required String title,
    @required String date,
    @required String time
  }) async
  {
     await database.transaction((txn)
    {
      txn.rawInsert(
          'INSERT INTO tasks(title, date, time, status) VALUES("$title","$date","$time","new")'
      ).then((value)
      {
        print('$value Done insert data to table');
        emit(InsertState());

        getDataFromDatabase(database);
      }).catchError((error)
      {
        print('Error when inserting Record: ${error.toString()}');

      });
      return null;
    });

  }

 void getDataFromDatabase(database)
  {

    newtasks = [];
    donetasks = [];
    archivedtasks = [];

     database.rawQuery('SELECT * FROM tasks').then((value)
     {
       value.forEach((element) {

         print(element['status']);
         if(element['status'] == 'new')
           newtasks.add(element);
         else if(element['status'] == 'done')
           donetasks.add(element);
         else if (element['status'] == 'archived')
           archivedtasks.add(element);
       });
     });

  }

  void updateData(
  {
  @required String status,
    @required int id
   }
      )
  {
    database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status',id]
     ).then((value)
    {
      getDataFromDatabase(database);
      emit(UpdateData());
    });
  }


  void deleteData( {@required int id} )
  {
    database.rawDelete(
        'DELETE FROM tasks WHERE id= ?', [id]
    ).then((value)
    {
      getDataFromDatabase(database);
      emit(DeleteData());
    });
  }

  var isbottomshown = false;
  var changeicon = Icons.edit;

  void ChangeBottomSheetState
  ({
    @required bool IsShow,
    @required IconData Changeicon
  })
  {
    isbottomshown = IsShow;
    changeicon = Changeicon;

    emit(BottomSheetState());
  }

  bool isDark = false;

  void changeAppMode({bool fromShared})
  {
    if(fromShared != null){
      isDark = fromShared;
      print(isDark);
      emit(AppChangeModeState());
    }
    else{
      isDark = !isDark;
      CachHelper.putBoolean(key: 'isDark', value: isDark).then((value){
        emit(AppChangeModeState());
      });
    }

    print(isDark);
  }

}