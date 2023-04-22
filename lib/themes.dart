import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thebattleofknowledge/helpers.dart';
import 'package:thebattleofknowledge/provider.dart';
import 'package:thebattleofknowledge/question.dart';

class Themes extends StatefulWidget {
  const Themes({Key? key}) : super(key: key);

  @override
  State<Themes> createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {
  @override
  Widget build(BuildContext context) {
    // final String level = Provider.of<AppProvider>(context).level;
    final List<Map<String, String>> themes = [
      {"tvandculture": "TV e Cultura"},
      {"sciences": "Ciências"},
      {"sports": "Esportes"},
      {"history": "História"},
      {"geography": "Geografia"},
      {"portuguese": "Português"},
    ];

    final List<Color> colors = [
      const Color.fromRGBO(234, 255, 44, 1),
      const Color.fromARGB(255, 44, 241, 255),
      const Color.fromARGB(255, 79, 255, 44),
      const Color.fromARGB(255, 255, 164, 44),
      const Color.fromARGB(255, 206, 44, 255),
      const Color.fromARGB(255, 255, 44, 44),
      const Color.fromARGB(255, 44, 58, 255),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Categoria'),
        ),
      ),
      body: Column(
        children: themes.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, String> theme = entry.value;
          return Expanded(
            child: GestureDetector(
              onTapUp: (details) {
                Provider.of<AppProvider>(context, listen: false)
                    .changeTheme(theme.keys.first);
                _question(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: ColorUtils.createRadialGradient(
                    colors[index],
                  ),
                ),
                child: Center(
                  child: Text(
                    theme.values.first,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _question(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Question(),
      ),
    );
  }
}
