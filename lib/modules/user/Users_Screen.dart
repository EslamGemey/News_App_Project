import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 1. build item. done
// 2. build list.
// 3. add item to list

class UserModel{
  final int id;
  final String name;
  final String phone;

  UserModel({
    @required this.id,
    @required this.name,
    @required this.phone,
});
}

class UsersScreen extends StatelessWidget{
  List<UserModel> users = [
    UserModel(
        id: 1, name: 'Ahmed Abdullah', phone: '01149783170'),
    UserModel(
        id: 2, name: 'Shady Yassin', phone: '01158685894'),
    UserModel(
        id: 3, name: 'Maged Azmey', phone: '01138498466'),
    UserModel(
        id: 1, name: 'Ahmed Abdullah', phone: '01149783170'),
    UserModel(
        id: 2, name: 'Shady Yassin', phone: '01158685894'),
    UserModel(
        id: 3, name: 'Maged Azmey', phone: '01138498466'),
    UserModel(
        id: 1, name: 'Ahmed Abdullah', phone: '01149783170'),
    UserModel(
        id: 2, name: 'Shady Yassin', phone: '01158685894'),
    UserModel(
        id: 3, name: 'Maged Azmey', phone: '01138498466'),
    UserModel(
        id: 1, name: 'Ahmed Abdullah', phone: '01149783170'),
    UserModel(
        id: 2, name: 'Shady Yassin', phone: '01158685894'),
    UserModel(
        id: 3, name: 'Maged Azmey', phone: '01138498466'),
    UserModel(
        id: 1, name: 'Ahmed Abdullah', phone: '01149783170'),
    UserModel(
        id: 2, name: 'Shady Yassin', phone: '01158685894'),
    UserModel(
        id: 3, name: 'Maged Azmey', phone: '01138498466'),
    UserModel(
        id: 1, name: 'Ahmed Abdullah', phone: '01149783170'),
    UserModel(
        id: 2, name: 'Shady Yassin', phone: '01158685894'),
    UserModel(
        id: 3, name: 'Maged Azmey', phone: '01138498466'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25
        ),),
      ),
      body: ListView.separated(
          itemBuilder: (context, index)=> buildUserItem(users[index]),
          separatorBuilder: (context, index)=> Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[500],
            ),
          ),
          itemCount: users.length,
      )
    );

  }

  Widget buildUserItem(UserModel user)=> Padding(
    padding: const EdgeInsets.all(25.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            '${user.id}',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.name}',style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),
            ),
            Text('${user.phone}',style: TextStyle(
                fontSize: 17,
                color: Colors.blueGrey
            ),
            )
          ],
        )
      ],
    ),
  );
}

