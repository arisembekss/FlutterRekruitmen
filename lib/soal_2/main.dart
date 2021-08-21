import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import 'itemcard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<Resultdata>? datas;
  List<Color> colors = <Color>[Colors.purple, Colors.purpleAccent,Colors.pink];
  @override
  void initState() {
    super.initState();
    final json =
        '{"codestatus":"200","message":"success","resultdata":[{"employee":"Developer 1","checktime":"2021-02-01 07:00:01","check_status":"in"},{"employee":"Developer 2","checktime":"2021-02-01 07:00:01","check_status":"in"},{"employee":"Developer 3","checktime":"2021-02-01 07:10:14","check_status":"out"}]}';
    //final json = '{"codestatus":"200","message":"success","resultdata":[{"employee":"Developer 1","checktime":"2021-02-01 07:00:01","check_status":"in"},null,{"employee":"Developer 2","checktime":null,"check_status":"in"},{"employee":"Developer 3","checktime":"2021-02-01 07:10:14","check_status":"out"}]}';
    final jsonMap = jsonDecode(json);
    final response = Response.fromJson(jsonMap as Map<String, dynamic>);
    datas = response.resultdata;
  }

  @override
  Widget build(BuildContext context) {
    //print(datas);
    return Scaffold(
      appBar: AppBar(
        title: Text("Soal Nomor 2"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Scroll",
              style: TextStyle(fontSize: 50),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: datas!.length,
                    itemBuilder: (context, index) {
                      return ItemCard(
                        note: datas![index].checkStatus as String,
                        date: datas![index].checktime as String,
                        color: colors[Random().nextInt(colors.length)],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    ); //TODO write your code here
  }
}


class Response {
  String? codestatus;
  String? message;
  List<Resultdata>? resultdata;

  Response({this.codestatus, this.message, this.resultdata});

  Response.fromJson(Map<String, dynamic> json) {
    codestatus = json['codestatus'] as String;
    message = json['message'] as String;
    if (json['resultdata'] != null) {
      resultdata = [];
      json['resultdata'].forEach((v) {
        resultdata?.add(new Resultdata.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codestatus'] = this.codestatus;
    data['message'] = this.message;
    if (this.resultdata != null) {
      data['resultdata'] = this.resultdata?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Resultdata {
  String? employee;
  String? checktime;
  String? checkStatus;

  Resultdata({this.employee, this.checktime, this.checkStatus});

  Resultdata.fromJson(Map<String, dynamic> json) {
    employee = json['employee'] as String;
    checktime = json['checktime'] as String;
    checkStatus = json['check_status'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employee'] = this.employee;
    data['checktime'] = this.checktime;
    data['check_status'] = this.checkStatus;
    return data;
  }
}
