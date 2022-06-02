import 'package:abdulahapp/modules/counter/cubit/cubit.dart';
import 'package:abdulahapp/modules/counter/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return BlocProvider(
      create:(BuildContext context)=> CounterCubit() ,

      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state)
        {
          if(state is CounterPlusState)
          {
            print('Counter plus state ${state.count}');
          }

          if(state is CounterMinusState)
          {
            print('Counter minus state ${state.count}') ;
          }

        },
        builder: (context, state){
          return Scaffold(
            appBar: AppBar(
              title: Text('Counter',style: TextStyle(
                  fontSize: 25
              ),),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: (){

                      CounterCubit.get(context).minus();
                      // print(counter);

                    },
                    child: Text(
                        '-',
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20
                    ),
                    child: Text(
                      '${CounterCubit.get(context).counter}',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                  TextButton(
                    onPressed: (){
                      CounterCubit.get(context).plus();
                      // print(counter);

                    },
                    child: Text(
                        '+',
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold
                        )),
                  ),
                ],
              ),
            ),
          );
        },
      )
    );
  }


}