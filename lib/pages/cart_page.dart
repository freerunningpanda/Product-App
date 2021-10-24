import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FakeStore App'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ListView(
              children: [
                ListTile()
              ],
            ),
            ElevatedButton(
              child: const Text(
                'Remove item',
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  primary: Colors.grey[900],
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
