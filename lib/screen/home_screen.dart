import 'package:flutter/material.dart';
import 'package:supa_1/integration/supabase.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    getData();
    return const Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Home Screen"),
        ],
      )),
    );
  }
}

getData() {
  SupabaseIntegration.supabase.client
      .from('messages')
      .stream(primaryKey: ['id']).listen((data) => print(data));
}
