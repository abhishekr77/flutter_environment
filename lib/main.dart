import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(
      fileName: kReleaseMode ? "key.env.release" : "key.env.debug");
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              dotenv.env['DEBUG'] == "true" ? "Debug Mode" : "Release Mode"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("base Url: ${dotenv.env['baseUrl']}")),
            Center(child: Text("Decrypt Key: ${dotenv.env['DECYPT_KEY']}"))
          ],
        ),
      ),
    );
  }
}
