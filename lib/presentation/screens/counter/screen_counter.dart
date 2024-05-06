import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';

class ScreenCounter extends ConsumerWidget {
  const ScreenCounter({super.key});

  static const String name = 'counter_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clickCounter = ref.watch(counterProvider);

    return  Scaffold(
      appBar: AppBar(
        title: const Text("Hola"),
      ),

      body: Center(
        child: Text("Valor: $clickCounter", style: Theme.of(context).textTheme.titleLarge,),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;

        },
        child: Icon(
          Icons.account_box_outlined
        )
      ),
    );
  }
}
