import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

//import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';
import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';
import 'networking.dart';
void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'JSON Path Finder'),
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
  Future<String> loadAsset(String fileName) async {
    String dataString = await rootBundle.loadString('assests/$fileName.txt');
    return dataString;
  }
// Networking network = Networking();

  Dio dio = new Dio();

  Map<String, dynamic>? dataModel;
  String mockData = '',path1 = '',path2 ='',path3 ='',path4 ='';

  Future firstApiFirstJson() async {
    final String pathUrl = ('http://192.168.0.109:8080/json1');
    var data = await loadAsset("jsonFile");
    var response = await dio.post(pathUrl, data: data);
    // headers: {
    //   "Content-Type": "application/json",
    // }
    setState(() {
      mockData = response.toString();
    });

    return response.data;
  }

  Future firstApiSecondJson() async {
    final String pathUrl = ('http://192.168.0.109:8080/json1');
    var data = await loadAsset("jsonFileTwo");
    var response = await dio.post(pathUrl, data: data);
    // headers: {
    //   "Content-Type": "application/json",
    // }
    setState(() {
      mockData = response.toString();
    });

    return response.data;
  }

  Future secondApi() async {
    final String pathUrl = ('http://192.168.0.109:8080/common');
    var data = await loadAsset("jsonFileMerged");
    var response = await dio.post(pathUrl, data: data);
    // headers: {
    //   "Content-Type": "application/json",
    // }
    setState(() {
      mockData = response.toString();
    });

    return response.data;
  }

  // Networking network = Networking();

  Future decodeData() async {
    final Map parsedData = await json.decode(mockData);
    setState(() {
      path1 = parsedData['path1'];
      path2 = parsedData['path2'];
      path3 = parsedData['path3'];
      path4 = parsedData['path4'];
    });
    // print(parsedData['path1']);
    // print(parsedData['path2']);

  }

  Future decodeData2() async {
    final Map parsedData = await json.decode(mockData);
    setState(() {
      path1 = parsedData['path1'];
      path2 = parsedData['path2'];
      path3 = parsedData['path3'];
      path4 = parsedData['path4'];
    });
    // print(parsedData['path1']);
    // print(parsedData['path2']);

  }
  Future decodeData3() async {
    final Map parsedData = await json.decode(mockData);
    setState(() {
      path1 = parsedData['path1'];
      path2 = parsedData['path2'];
      path3 = parsedData['path3'];
      path4 = parsedData['path4'];
    });
    // print(parsedData['path1']);
    // print(parsedData['path2']);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              color: Colors.black,
              onPressed: () async {
                print('posting');
                await firstApiFirstJson().then((value) {
                  //         print(value);
                }).whenComplete(() async {
                  await decodeData();
                });
              },
              child: Text(
                '1st JSON File',
                style: TextStyle(color: Colors.cyan),
              ),
            ),
            Text('paths are $path1 -> $path2'),

            SizedBox(height: 70,),

            MaterialButton(
              color: Colors.black,
              onPressed: () async {
                print('post');
                await firstApiSecondJson().then((value) {
                  //         print(value);
                }).whenComplete(() async {
                  await decodeData2();
                });
              },
              child: Text(
                '2nd JSON File',
                  style: TextStyle(color: Colors.cyan),
              ),
            ),
           Text('paths are $path1 $path2 $path3 $path4'),

            SizedBox(height: 70,),

            MaterialButton(
              color: Colors.black,
              onPressed: () async {
                print('Common');
                await secondApi().then((value) {
                  //         print(value);
                }).whenComplete(() async {
                  await decodeData3();
                });
              },
              child: Text(
                'Common',
                style: TextStyle(color: Colors.cyan),
              ),
            ),
            Text('Common path $path1 $path2 $path3 $path4'),
          ],
        ),
      ),
    );
  }
}
