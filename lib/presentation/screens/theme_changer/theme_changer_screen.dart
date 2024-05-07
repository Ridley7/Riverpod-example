import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  const ThemeChangerScreen({super.key});

  static const String name = 'theme_change_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Changer"),
        actions: [
          IconButton(
              onPressed: (){
                //ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
                ref.read(themeNotifierProvider.notifier).toggleDarkMode();
              },
              icon: Icon (isDarkMode ? Icons.dark_mode : Icons.light_mode)
          )
        ],
      ),

      body: ThemeChangerView(),
    );
  }
}

class ThemeChangerView extends ConsumerWidget {
  const ThemeChangerView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<Color> colors = ref.watch(colorThemeProvider);
    //final int selectedIndex = ref.watch(selectedColorProvider);
    final int selectedIndex = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
        itemBuilder:(context, index){
        final color = colors[index];
        return RadioListTile(
          title: Text("Este color", style: TextStyle(color: color),),
            subtitle: Text("${color.value}"),
            activeColor: color,
            value: index,
            groupValue: selectedIndex,
            onChanged: (value){
            //ref.read(selectedColorProvider.notifier).state = index;
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
            }
        );
        }
    );
  }
}
