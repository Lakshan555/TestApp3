import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CallApi()
    );
  }
}

class CallApi extends StatefulWidget {
  const CallApi({Key? key}) : super(key: key);

  @override
  _CallApiState createState() => _CallApiState();
}

class _CallApiState extends State<CallApi> {

  final url = 'https://jsonplaceholder.typicode.com/posts';

  var _postjason = [];

  void fectPost() async {

    try{
      final response = await get(Uri.parse(url));
      final jsonData  =  jsonDecode(response.body) as List;

      setState(() {
        _postjason = jsonData;
      });

    }catch(err){
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fectPost();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _postjason.length,
          itemBuilder: (context, i){
            final post = _postjason[i];
            return
              Card(
                child: ListTile(
                title: Text(post['title'],
                ),
                subtitle:
                Text(' ID: ${post["id"]}'),
            ),
              );
          }
      ) ,
    );
  }
}


// Card(
// margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: [
// Text(
// "Title: ${post["title"]}"
// ),
// Text(
// "userId: ${post["id"]}"
// ),
//
// ],
// ),
// ),
// );
