import 'dart:typed_data';
import 'dart:ui';
import 'dart:async';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:flutter/services.dart
import "dart:io";
class Picked extends StatefulWidget {
  const Picked({Key? key}) : super(key: key);

  @override
  _PickedState createState() => _PickedState();
}

_requestPermission() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.storage,
  ].request();

  final info = statuses[Permission.storage].toString();
  print(info);
}
class _PickedState extends State<Picked> {
  GlobalKey _globalKey = GlobalKey();
  ScreenshotController screenshotController = ScreenshotController();
  File image = new File("C:/Users/bashar/StudioProjects/untitled/images/sea.png");
  late File result;
  late File snapshot ;
  final imagepicker = ImagePicker();


  upload()  async{
     var pickedimage = await imagepicker.pickImage(source: ImageSource.gallery);
     if (pickedimage != null){
       setState(() {
         image = File(pickedimage.path);
       });

     }

     else {}

  }

  savesnapshot() async {
    result = (await screenshotController.capture()) as File;
    final name = " screenshot$DateTime";
    var response =  await screenshotController.capture();

    result =await  ImageGallerySaver.saveImage(
        Uint8List.fromList(response!),
        quality: 60,
        name: name);
      setState(() {
        GallerySaver.saveImage(result.path);

      });

  }
  void initState() {
    super.initState();

    _requestPermission();

  }
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(

        child: Column(
          children: [
            Screenshot(
                controller: screenshotController,

                child: Container(
                height: 400,
                  child: SingleChildScrollView(
                      child:   Column(

                        children: [

                          TextFormField(
                            keyboardType: TextInputType.text,

                          ),



                          image == null ? Text("no image yet ") :  new Image.file(image),

          ],
        )





              ),
                )
          ),
            ElevatedButton(onPressed:upload,
                child: Text("add image")),
            ElevatedButton(onPressed:savesnapshot,


                child: Text("CAPUTRE IMAGE")),
             ]
      )
      ),
    floatingActionButton: FloatingActionButton(
    onPressed: () async{
       image = (await screenshotController.capture()) as File;
    },
      child:Icon(Icons.camera_alt_outlined),
    ),


    );



  }

}
