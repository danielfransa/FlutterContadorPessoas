import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //debugShowCheckedModeBanner: false, //tira o banner de debug
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  void decrement() {
    setState(() {
      counter--;
    });
  }

  void increment() {
    setState(() {
      counter++;
    });
  }

  bool get isEmpty => counter == 0;
  bool get isFull => counter == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/sorveteria-02.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'Lotado' : 'Pode Entrar',
              style: TextStyle(
                  fontSize: 45,
                  color: isFull
                      ? Color.fromARGB(255, 247, 5, 5)
                      : Color.fromARGB(255, 3, 5, 117),
                  fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.all(45),
              child: Text(
                '$counter',
                style: TextStyle(
                    fontSize: 100,
                    color: isFull
                        ? Color.fromARGB(255, 247, 5, 5)
                        : Color.fromARGB(255, 3, 5, 117),
                    fontWeight: FontWeight.w700),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                      backgroundColor: isEmpty
                          ? Colors.white.withOpacity(0.3)
                          : Colors.white,
                      fixedSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24))),
                  child: const Text(
                    'Saiu',
                    style: TextStyle(
                        color: Color.fromARGB(255, 3, 5, 117),
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                      backgroundColor:
                          isFull ? Colors.white.withOpacity(0.3) : Colors.white,
                      fixedSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24))),
                  child: const Text(
                    'Entrou',
                    style: TextStyle(
                        color: Color.fromARGB(255, 3, 5, 117),
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
