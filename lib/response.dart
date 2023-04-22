import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thebattleofknowledge/helpers.dart';
import 'package:thebattleofknowledge/main.dart';
import 'package:thebattleofknowledge/provider.dart';

class Response extends StatefulWidget {
  const Response({Key? key}) : super(key: key);

  @override
  State<Response> createState() => _ResponseState();
}

class _ResponseState extends State<Response> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Pergunta'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(46.0),
          child: SizedBox(
            width: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 9,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        gradient: ColorUtils.createRadialGradient(
                          const Color.fromARGB(255, 240, 52, 93),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              Provider.of<AppProvider>(context, listen: false)
                                  .selectedQuestion
                                  .values
                                  .first,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 26.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyHomePage(),
                            ),
                            (route) => false),
                        child: const Text('Nova Pergunta'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
