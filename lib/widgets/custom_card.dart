import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final Widget pageview;

  const CustomCard(
    this.title,
    this.pageview, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        tileColor: Theme.of(context).primaryColor,
        title: Text(
          title,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pageview),
          );
        },
      ),
    );
  }
}
