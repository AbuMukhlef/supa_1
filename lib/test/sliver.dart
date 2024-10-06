import 'package:flutter/material.dart';

import '../integration/supabase.dart';

class Sliver extends StatelessWidget {
  const Sliver({super.key});

  @override
  Widget build(BuildContext context) {
    final data = getData();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Sliver'),
            pinned: true,
            expandedHeight: 250.0,
            floating: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, index) => ListTile(
                title: Text('$data'),
              ),
            ),
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, index) => ListTile(
          //       title: Text('Item $index'),
          //     ),
          //     childCount: 20,
          //   ),
          // ),
        ],
      ),
    );
  }
}

getData() {
  List response = [];
  SupabaseIntegration.supabase.client
      .from('messages')
      .stream(primaryKey: ['id']).listen((List<Map<String, dynamic>> data) {
    response = data;
  });

  return response;
}
