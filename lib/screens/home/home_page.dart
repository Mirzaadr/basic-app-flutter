import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/routes/main_route.dart';
import 'package:starter_app/utils/counter.dart';

final provider = StateNotifierProvider((ref) => CounterNotifier());

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer(builder: (context, watch, child) {
              int count = watch(provider).count;
              return Text(
                '$count',
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            ElevatedButton(
                onPressed: () => context.read(provider.notifier).decrement(),
                child: Text('Min')),
            ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(AppRoutes.signIn),
                child: Text('Sign In'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read(provider.notifier).increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
