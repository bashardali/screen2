import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import "dart:io";
import 'dart:async';
class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("screenshot"),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Column(

            children: [

              TextFormField(
                keyboardType: TextInputType.text,

              ),
              ElevatedButton(onPressed:(){},
                  child: Text("add Image")),

           //   Image == null ? Text("no image yet ") :  Image.file(image),


            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child:Icon(Icons.camera_alt_outlined),

      ),
    );
  }
}
