import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:listtest/Info.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'All Lists'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> data=[];
  Future<void> getData() async{
    final res=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if(res.statusCode==200){
        setState(() {
          data=json.decode(res.body);
        });
      print(res.body);

    }else{
      throw Exception("Failed to load data");
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    getData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoPage(title:data[index]['title'],body:data[index]['body'])));
            },
            child: ListTile(
              title: Text(data[index]['title']),
              trailing: Icon(Icons.navigate_next),
            ),
          );
        },

      ),

    );
  }
}
