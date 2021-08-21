
import 'package:flutter/material.dart';

class ItemListCard extends StatelessWidget {
  const ItemListCard({Key? key, required this.employee, required this.address, required this.color}) : super(key: key);
  final String employee, address;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              //flex: 2,
              child: Icon(
                Icons.account_circle,
                size: 60,
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
                flex: 3,
                child: ItemDescription(
                  employee: employee,
                  address: address,
                )
            ),
          ],
        ),
      ),
    );
  }
}

class ItemDescription extends StatelessWidget {
  const ItemDescription({Key? key, required this.employee, required this.address}) : super(key: key);
  final String employee, address;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nama",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white60
          ),),
          Text(employee,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Text("Alamat",
            style: TextStyle(
                fontSize: 15,
                color: Colors.white60),),
          Text(address,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}