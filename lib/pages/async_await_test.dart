import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;

  void getData() async {
    // // simulating network request for a username
    // String username = await Future.delayed(Duration(seconds: 3), (){
    //   return 'shivanshu';
    // });
    //
    // String bio = await Future.delayed(Duration(seconds: 2), (){
    //   return 'vegan, musician & egg collector';
    // });
    //
    // print('$username - $bio');
    Response response = await get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
      headers: {
        'Accept': 'application/json',
        'User-Agent': 'FlutterApp/1.0',
      },);
    Map data = jsonDecode(response.body);
    print(data['title']);

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initstate function ran');
    getData();
    print('getData done');
  }

  @override
  Widget build(BuildContext context) {
    print('Build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ElevatedButton(
        onPressed: (){
          setState(() {
            counter += 1;
          });
        },
        child: Text ('counter is $counter'),
      ),
    );
  }
}
