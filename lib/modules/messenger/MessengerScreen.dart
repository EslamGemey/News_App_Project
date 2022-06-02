import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MessengerScreen  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar (
        titleSpacing: 20,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            // Done
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://scontent.fcai1-3.fna.fbcdn.net/v/t1.6435-9/208950137_1123301191487602_6194747900094686211_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeFxMlRyie0SqSqB_9SIQS_FszFF2KUxbTmzMUXYpTFtOdbgMiNqnZlHl-OfFiUE8U7XbsvCwVYdOLKmTAQkV3pC&_nc_ohc=rQM07c8HxvwAX9rG1ZX&_nc_ht=scontent.fcai1-3.fna&oh=24c91d51102d2a83c7fc224c6dbe001d&oe=6159D2CA'),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Chats',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.blue,
            child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 16,
            ),
          )
          ),
          // SizedBox(width: 3),
          IconButton(onPressed: (){}, icon: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.blue,
            child: Icon(
                Icons.edit,
              size: 16,
              color: Colors.white,
            ),
          )
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      10.0
                  ),
                   color: Colors.grey[400],
                ),
                padding: EdgeInsets.all(5.0),

                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 7,),
                    Text('Search',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 120,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index)=> buildStoryItem(),
                    separatorBuilder: (context, index)=>SizedBox(
                      width: 10,
                    ),
                    itemCount: 10
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index)=> buildChatItem(),
                  separatorBuilder: (context, index)=> SizedBox(
                    height: 15,
                  ),
                  itemCount: 17
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatItem() => Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://scontent.fcai1-3.fna.fbcdn.net/v/t1.6435-9/208950137_1123301191487602_6194747900094686211_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeFxMlRyie0SqSqB_9SIQS_FszFF2KUxbTmzMUXYpTFtOdbgMiNqnZlHl-OfFiUE8U7XbsvCwVYdOLKmTAQkV3pC&_nc_ohc=rQM07c8HxvwAX9rG1ZX&_nc_ht=scontent.fcai1-3.fna&oh=24c91d51102d2a83c7fc224c6dbe001d&oe=6159D2CA'),
            radius: 30,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 10,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                end: 3,
                bottom: 3
            ),
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 7,
            ),
          )
        ],
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Islam Gamal Mahmoud',style: TextStyle(
                fontSize: 17,fontWeight: FontWeight.bold
            ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'hello my name is eslam hi how are you',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text('02:00 pm'
                )

              ],
            ),

          ],
        ),
      )
    ],
  );
  Widget buildStoryItem() => Container(
    width: 60,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://scontent.fcai1-3.fna.fbcdn.net/v/t1.6435-9/208950137_1123301191487602_6194747900094686211_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeFxMlRyie0SqSqB_9SIQS_FszFF2KUxbTmzMUXYpTFtOdbgMiNqnZlHl-OfFiUE8U7XbsvCwVYdOLKmTAQkV3pC&_nc_ohc=rQM07c8HxvwAX9rG1ZX&_nc_ht=scontent.fcai1-3.fna&oh=24c91d51102d2a83c7fc224c6dbe001d&oe=6159D2CA'),
              radius: 30,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 10,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  end: 3,
                  bottom: 3
              ),
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 7,
              ),
            )
          ],
        ),
        SizedBox(
          height: 6,
        ),
        Text('Eslam Gamal Mahmoud',style: TextStyle(
            fontSize: 15
        ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,)
      ],
    ),
  );
}
