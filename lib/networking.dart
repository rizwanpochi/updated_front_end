// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// //import 'package:http/http.dart' as http;
// import 'package:convert/convert.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'dart:convert';
// import 'dart:async' show Future;
// import 'package:flutter/services.dart' show rootBundle;
//
// class Networking {
//   Future<String> loadAsset(String fileName) async {
//     String dataString = await rootBundle.loadString('assests/$fileName.txt');
//     return dataString;
//   }
//   Dio dio = new Dio();
//
//   Map<String, dynamic>? dataModel;
//   String mockData = '',path1 = '',path2 ='';
//
//   Future firstApiFirstJson() async {
//     final String pathUrl = ('http://192.168.0.109:8080/json1');
//     var data = await loadAsset("jsonFile");
//     var response = await dio.post(pathUrl, data: data);
//     // headers: {
//     //   "Content-Type": "application/json",
//     // }
//     setState(() {
//       mockData = response.toString();
//     });
//
//     return response.data;
//   }
//
//   // Networking network = Networking();
//
//   Future decodeData() async {
//     final Map parsedData = await json.decode(mockData);
//     setState(() {
//       path1 = parsedData['path1'];
//       path2 = parsedData['path2'];
//     });
//     // print(parsedData['path1']);
//     // print(parsedData['path2']);
//   }
//
//
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
// //
// // Future<String> loadAsset(String fileName) async {
// //   String dataString = await rootBundle.loadString('assets/$fileName.txt');
// //   return dataString;
// // }
// // Dio dio = new Dio();
// //
// // Future firstApiFirstJson() async {
// //   final String pathUrl = ('http://192.168.0.109:8080/json1');
// //   var data = await loadAsset("jsonFile");
// //   var response = await dio.post(pathUrl, data: data);
// //   // headers: {
// //   //   "Content-Type": "application/json",
// //   // }
// // return response.data;
// // }
