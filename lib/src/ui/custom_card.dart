import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final id;
  final title;
  final body;

  const CustomCard(this.id, this.title, this.body);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: const EdgeInsets.all(5.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  this.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Text(this.body),
              )
            ],
          ),
        ),
      ),
    );
  }
}
