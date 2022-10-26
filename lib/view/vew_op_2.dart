import 'package:flutter/material.dart';

void main() => runApp(const Opcion2());

class Opcion2 extends StatelessWidget {
  const Opcion2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
