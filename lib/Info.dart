import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:listtest/main.dart';

class InfoPage extends StatelessWidget {
  final String title;
  final String body;
  const InfoPage({super.key,required this.title,required this.body});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("datails screen")
      ),
      body: Expanded(
        child: Container(


          child: Column(
            
            children: [
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.all(12),
                      child: Text("Title",style: TextStyle( fontWeight: FontWeight.w900))),
                  
                  Container( margin:EdgeInsets.all(12),child: Text(title))
                ],
        
              ),
              Row(
                children: [
                  Container( margin :EdgeInsets.all(12),child: Text("Body",style: TextStyle( fontWeight: FontWeight.w900))),

                  Expanded(child: Container( margin:EdgeInsets.all(12),child: Text(body)))
                ],
        
              ),
              OutlinedButton(onPressed: (){
                  Navigator.pop(context);
              }, child: Text("Go Back"))
          
            ],
          ),
        ),
      ),
    );
  }
}
