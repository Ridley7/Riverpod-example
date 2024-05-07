import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ScreenCounter extends ConsumerWidget {
  const ScreenCounter({super.key});

  static const String name = 'counter_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return  Scaffold(
      appBar: AppBar(
        title: const Text("Hola"),
        actions: [
          IconButton(
              onPressed:(){
                //ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
                ref.read(themeNotifierProvider.notifier).toggleDarkMode();
              },
              icon:  Icon (isDarkMode ? Icons.light_mode : Icons.dark_mode)
          )
        ],
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
