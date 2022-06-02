import 'package:abdulahapp/modules/users/web_view/web_view_screen.dart';
import 'package:abdulahapp/shared/cubit/cubit.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultbutton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUPPer = true,
  @required String text,
  @required Function function


})=>
Container(
   width: width,
   color: background,
   child: MaterialButton(
   onPressed: function,
   child: Text(
       '$text',style: TextStyle(color: Colors.white,
       fontSize: 20,
       fontWeight: FontWeight.bold
        ),
       ),
     ),
   );

Widget defaultformfield({
  @required TextEditingController controller,
  @required TextInputType type,
   // Function OnSubmite,
  bool ispassword = false,
  Function OnChanged,
  @required Function Validate,
  @required String LabelText,
  @required IconData iconprefix,

  Function suffixpressed,
  IconData iconsuffix,
  Function ontap,

  // String? value
}) => TextFormField(
  onTap: ontap,
  controller: controller,
  keyboardType: type,
  obscureText: ispassword,
  onChanged: OnChanged,
  // onFieldSubmitted: OnSubmite(),
  // onChanged:OnChanged!(),
  validator: Validate,
  decoration: InputDecoration(
      labelText: '$LabelText',

      border: OutlineInputBorder(),
      prefixIcon: Icon(
          iconprefix
      ),
      suffixIcon: iconsuffix != null? IconButton(
          onPressed: suffixpressed,
          icon: Icon(
            iconsuffix
          )) : null

  ),
);


Widget buildTaskItem(Map model, context)=>Dismissible(

  key: Key(model['id'].toString()),
  onDismissed: (direction)
  {
    AppCubit.get(context).deleteData(
        id: model['id']
    );
  },
  child:Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children:

      [

        CircleAvatar(

          radius: 40,

          backgroundColor: Colors.blue,

          child: Text('${model['time']}',style: TextStyle(

              fontSize: 17,

              fontWeight: FontWeight.bold

          ),),

        ),

        SizedBox(

          width: 20.0,

        ),

        Expanded(

          child: Column(

            mainAxisSize: MainAxisSize.min,

            crossAxisAlignment: CrossAxisAlignment.start,

            children:

            [

              Text(

                '${model['title']}',

                style: TextStyle(

                    fontWeight: FontWeight.bold,

                    fontSize: 18.0

                ),

              ),

              Text(

                '${model['date']}',

                style: TextStyle(

                    fontWeight: FontWeight.bold,

                    fontSize: 16.0,

                    color: Colors.grey

                ),

              ),

            ],

          ),

        ),

        SizedBox(

          width: 20.0,

        ),

        IconButton(

            onPressed:()

            {

              AppCubit.get(context).updateData(

                  status: 'done',

                  id: model['id']

              );



            },

            icon: Icon(

              Icons.check_box,

              color: Colors.green,

            )

        ),

        IconButton(

            onPressed:()

            {

              AppCubit.get(context).updateData(

                  status: 'archived',

                  id: model['id']

              );

            },

            icon: Icon(

                Icons.archive,

              color: Colors.black45,

            )

        )



      ],

    ),

  ),

);

Widget tasksbuilder({@required List<Map> tasks})=>ConditionalBuilder(
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

Widget buildArticleItem(article,context) => InkWell(
  onTap: ()
  {
    navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Padding(

    padding: const EdgeInsets.all(20),

    child: Row(

      children: [

        Container(

          width: 120,

          height: 120,

          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10),

              image: DecorationImage(

                  image: NetworkImage('${article['urlToImage']}'),

                  fit: BoxFit.cover

              )

          ),

        ),

        SizedBox(

          width: 20,

        ),

        Expanded(

          child: Container(

            height: 120.0,

            child: Column(

              mainAxisSize: MainAxisSize.min,

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                Expanded(

                  child: Text(

                    '${article['title']} ',

                    style: Theme.of(context).textTheme.bodyText1,

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis,

                  ),

                ),

                Text(

                  '${article['publishedAt']}',

                  style: TextStyle(

                      color: Colors.grey

                  ),

                )

              ],

            ),

          ),

        )

      ],

    ),

  ),
);

Widget myDivider()=>Padding(
  padding: const EdgeInsets.all(15),
  child:   Container(

    width: double.infinity,

    color: Colors.grey[300],

    height: 1,

  ),
);

Widget articleBuilder(list,context)=>ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) =>
      ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index)=>buildArticleItem(list[index],context),
          separatorBuilder:(context, index)=> myDivider(),
          itemCount: 10
      ),
  fallback: (context) => Center(
      child: CircularProgressIndicator()
  ),
);

void navigateTo(context, widget)=> Navigator.push(context, MaterialPageRoute(builder: (context)=>widget)
    );