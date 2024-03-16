import 'package:flutter/material.dart';

class LeadsScreen extends StatelessWidget {
  static const routeName = '/leads';
  const LeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leads'),
      ),
      body: const Center(
        child: Text('Leads Screen'),
      ),
    );
  }
}
