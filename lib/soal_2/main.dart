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

    final json = '{"codestatus":"200","message":"success","resultdata":[{"employee":"Developer 1","checktime":"2021-02-01 07:00:01","check_status":"in"},null,{"employee":"Developer 2","checktime":null,"check_status":"in"},{"employee":"Developer 3","checktime":"2021-02-01 07:10:14","check_status":"out"}]}';
    final jsonMap = jsonDecode(json);
    final response = Response.fromJson(jsonMap as Map<String, dynamic>);
    datas = response.resultdata;
  }

  @override
  Widget build(BuildContext context) {
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
                        date: datas![index].checktime as DateTime,
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
  Response({
    this.codestatus,
    this.message,
    this.resultdata,
  });

  String? codestatus;
  String? message;
  List<Resultdata>? resultdata;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    codestatus: json["codestatus"],
    message: json["message"],
    resultdata: List<Resultdata>.from(json["resultdata"].map((x) => x == null ? null : Resultdata.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "codestatus": codestatus,
    "message": message,
    "resultdata": List<dynamic>.from(resultdata!.map((x) => x.toJson())),
  };
}

class Resultdata {
  Resultdata({
    this.employee,
    this.checktime,
    this.checkStatus,
  });

  String? employee;
  DateTime? checktime;
  String? checkStatus;

  factory Resultdata.fromJson(Map<String, dynamic> json) => Resultdata(
    employee: json["employee"],
    checktime: json["checktime"] == null ? null : DateTime.parse(json["checktime"]),
    checkStatus: json["check_status"],
  );

  Map<String, dynamic> toJson() => {
    "employee": employee,
    "checktime": checktime == null ? null : checktime!.toIso8601String(),
    "check_status": checkStatus,
  };
}
