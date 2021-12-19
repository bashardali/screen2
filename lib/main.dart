import 'package:flutter/material.dart';
import 'package:untitled/pages/loading.dart';
import 'package:untitled/pages/picked.dart';
import 'package:untitled/pages/screen.dart';


void main() {
  return runApp(


      MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/picked',
          routes:{
            '/loading':  (context)=> Loading(),
            '/screen':  (context)=> Screen(),
            '/picked':  (context)=> Picked(),

          }
      )
  );
}