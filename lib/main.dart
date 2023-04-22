import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thebattleofknowledge/helpers.dart';
import 'package:thebattleofknowledge/provider.dart';
import 'package:thebattleofknowledge/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        title: 'Batalha do Conhecimento',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<AppProvider>(context, listen: false).shuffle();

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Níveis')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTapUp: (details) {
                Provider.of<AppProvider>(context, listen: false)
                    .changeLevel('noob');
                _themes(context);
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Novato',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: ColorUtils.createRadialGradient(
                    const Color.fromRGBO(234, 255, 44, 1),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTapUp: (details) {
                Provider.of<AppProvider>(context, listen: false)
                    .changeLevel('smartass');
                _themes(context);
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Sabichão',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: ColorUtils.createRadialGradient(
                    const Color.fromRGBO(80, 255, 45, 1),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTapUp: (details) {
                Provider.of<AppProvider>(context, listen: false)
                    .changeLevel('beast');
                _themes(context);
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Fera',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: ColorUtils.createRadialGradient(
                    const Color.fromRGBO(50, 46, 255, 1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Reiniciar o jogo'),
                content: Text('Você tem certeza?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('Não'),
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<AppProvider>(context, listen: false)
                          .resetGame();
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('Sim'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  void _themes(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Themes(),
      ),
    );
  }
}
