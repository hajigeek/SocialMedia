import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users/api/userApi.dart';
import 'package:users/model/userModel.dart';

class UsersCall extends StatefulWidget {
  const UsersCall({Key? key}) : super(key: key);
  _UsersCallState createState() => _UsersCallState();
}

class _UsersCallState extends State<UsersCall> {
  late List<UserModel>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await apiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _userModel!.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(_userModel![index].username.toString()),
                subtitle: Text(_userModel![index].address.toString()),
                trailing: Text('${index}m ago'),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=$index"),
                ),
              ),
            );
          }),
    );
  }
}
