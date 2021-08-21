// To parse this JSON data, do
//
//     final response = responseFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rekrutmen/soal_3/itemlistcard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _MyWidget();
}

class _MyWidget extends State<MyWidget>{
  late List<Result> datas;
  @override
  void initState() {
    super.initState();
    final json = '{"codestatus":"200","message":"success","result":[{"employee":"Developer 1","address":"Jalan Raya, Kecamatan, Kabupaten, Provinsi - 13000"},{"employee":"Developer 2","address":"Jalan Raya, Kecamatan, Kabupaten, Provinsi - 13000"},{"employee":"Developer 3","address":"Jalan Raya, Kecamatan, Kabupaten"}]}';
    final jsonmap = jsonDecode(json);
    final response = Response.fromJson(jsonmap as Map<String, dynamic>);
    datas = response.result!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Soal nomor 3"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Scroll soal 3"),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemBuilder: (context, index){
                        return ItemListCard(
                          employee: datas[index].employee as String,
                          address: datas[index].address as String,
                        );
                      }
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}

class Response {
  Response({
    this.codestatus,
    this.message,
    this.result,
  });

  String? codestatus;
  String? message;
  List<Result>? result;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    codestatus: json["codestatus"],
    message: json["message"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "codestatus": codestatus,
    "message": message,
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.employee,
    this.address,
  });

  String? employee;
  String? address;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    employee: json["employee"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "employee": employee,
    "address": address,
  };
}
