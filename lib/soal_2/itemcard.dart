
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key, required this.note, required this.date}) : super(key: key);
  final String note, date;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              //flex: 2,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12.0)
                ),
              ),
            ),
            SizedBox(width: 20,),
            Expanded(
                flex: 3,
                child: ItemDescription(
                  title: note,
                  subtitle: date,
                )
            ),
          ],
        ),
      ),
    );
  }
}

class ItemDescription extends StatelessWidget {
  const ItemDescription({Key? key, required this.title, required this.subtitle}) : super(key: key);
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(subtitle),
          ),
        ],
      ),
    );
  }
}