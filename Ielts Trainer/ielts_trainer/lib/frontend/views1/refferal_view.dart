import 'package:flutter/material.dart';

class RefferalView extends StatefulWidget {
  const RefferalView({super.key});

  @override
  State<RefferalView> createState() => _RefferalViewState();
}

class _RefferalViewState extends State<RefferalView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Refferal")),
    );
  }
}
