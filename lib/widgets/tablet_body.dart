import 'package:flutter/material.dart';

class TabletBody extends StatelessWidget {
  const TabletBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 450,
                    width: double.infinity,
                    color: Colors.red,
                    child: const Center(child: Text('Hello, World!')),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 220,
                    width: double.infinity,
                    color: Colors.blue,
                    child: const Center(child: Text('Hello, World!')),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 220,
                          width: double.infinity,
                          color: Colors.green,
                          child: const Center(child: Text('Hello, World!')),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 220,
                          width: double.infinity,
                          color: Colors.green,
                          child: const Center(child: Text('Hello, World!')),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
