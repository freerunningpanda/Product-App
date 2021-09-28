import 'package:flutter/material.dart';

void main() => runApp(ProductFakeStoreApp());

class ProductFakeStoreApp extends StatefulWidget {
  @override
  State<ProductFakeStoreApp> createState() => _ProductFakeStoreAppState();
}

class _ProductFakeStoreAppState extends State<ProductFakeStoreApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product page',
      home: Scaffold(
        appBar: AppBar(
          title: Text('FakeStore App'),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
        ),
        body: Column(
          children: [
            Text(
              'ID:',
              style: TextStyle(fontSize: 20.0, color: Colors.black87),
            ),
            Text(
              'title:',
              style: TextStyle(fontSize: 20.0, color: Colors.black87),
            ),
            Text(
              'price:',
              style: TextStyle(fontSize: 20.0, color: Colors.black87),
            ),
            Text(
              'category:',
              style: TextStyle(fontSize: 20.0, color: Colors.black87),
            ),
            Text(
              'description:',
              style: TextStyle(fontSize: 20.0, color: Colors.black87),
            ),
            Image.network(
                'https://static.onlinetrade.ru/img/items/m/_34057_1.jpg'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Text('Обновить'),
          backgroundColor: Colors.grey[900],
          onPressed: () {},
        ),
        backgroundColor: Colors.grey[100],
      ),
    );
  }
}
