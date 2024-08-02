import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutty/pages/activity.dart';
import 'package:flutty/pages/deneme_home.dart';
import 'package:flutty/pages/duties.dart';
import 'package:flutty/pages/login.dart';
import 'package:flutty/pages/profile.dart';

import '../services/firebase_service.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 400,
                  );
                },
              );
            },
            child: Text('data'),
          ),
          users.when(
            data: (data) => Column(
              children: data
                  .map((e) => ListTile(
                        title: Text(e.name),
                        subtitle: Text(e.username),
                      ))
                  .toList(),
            ),
            error: (error, stackTrace) => Text('${error.toString()}'),
            loading: () => CircularProgressIndicator.adaptive(),
          )
        ],
      ),
    );
  }
}
