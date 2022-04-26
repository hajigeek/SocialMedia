import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users/api/userApi.dart';
import 'package:users/model/userModel.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
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
        backgroundColor: Colors.grey,
        body: ListView.builder(
            itemCount: _userModel!.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                width: 250,
                height: 400,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                      child: Row(
                        children: [
                          Container(
                              width: 60,
                              height: 60,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=$index"),
                              )),
                          SizedBox(width: 10),
                          Text(_userModel![index].username.toString(),
                              style: TextStyle(
                                fontSize: 25,
                              )),
                        ],
                      ),
                    ),
                    Container(margin: EdgeInsets.only(top: 10), width: MediaQuery.of(context).size.width, height: 260, decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0), image: DecorationImage(image: NetworkImage("https://d1csarkz8obe9u.cloudfront.net/posterpreviews/islamic-quotes-instagram-facebook-design-template-b55e44c3fa0e4d809f5110cc873188cf_screen.jpg?ts=1595495737"), fit: BoxFit.cover))),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {
                              print('favorite');
                            },
                            icon: Icon(Icons.favorite, size: 35),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.comment, size: 35),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.share, size: 35),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }));
  }
}
