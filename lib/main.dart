import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      if (count != 0) {
        count--;
      }
    });
  }

  void increment() {
    setState(() {
      if (count != 20) {
        count++;
      }
    });
  }

  void zerar() {
    setState(() {
      count = 0;
    });
    Navigator.pop(context);
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color(0xff1f005c),
              Color(0xff5b0060),
              Color(0xff870160),
              Color(0xffac255e),
              Color(0xffca485c),
              Color(0xffe16b5c),
              Color(0xfff39060),
              Color(0xffffb56b),
            ], // Gradient from https://learnui.design/tools/gradient-generator.html
            tileMode: TileMode.mirror,
          ),
          /*image: DecorationImage(
            image: AssetImage('assets/images/sorvete.jpg'),
            fit: BoxFit.cover,
          ),*/
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? "Está cheio!" : "Pode entrar!",
              style: const TextStyle(
                fontSize: 50,
                color: Color.fromRGBO(255, 255, 255, 0.8),
                fontWeight: FontWeight.w800,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(35),
              child: Text("$count",
                  style: TextStyle(
                    fontSize: 100,
                    color: isFull
                        ? const Color.fromRGBO(255, 0, 0, 1)
                        : const Color.fromRGBO(255, 255, 255, 0.8),
                  )),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: isEmpty
                          ? const Color.fromRGBO(255, 255, 255, 0.2)
                          : const Color.fromRGBO(255, 255, 255, 0.8),
                      padding: const EdgeInsets.fromLTRB(60, 25, 60, 25),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: isEmpty ? null : decrement,
                    child: const Text(
                      'Saiu',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: isFull
                          ? const Color.fromRGBO(255, 255, 255, 0.2)
                          : const Color.fromARGB(204, 255, 255, 255),
                      padding: const EdgeInsets.fromLTRB(60, 25, 60, 25),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: isFull ? null : increment,
                    child: const Text(
                      'Entrou',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: isEmpty
                    ? const Color.fromARGB(200, 216, 80, 141)
                    : const Color.fromARGB(202, 221, 3, 130),
                padding: const EdgeInsets.fromLTRB(60, 25, 60, 25),
                primary: const Color.fromARGB(255, 20, 20, 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              onPressed: isEmpty
                  ? null
                  : () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('ZERAR CONTADOR'),
                          content: const Text(
                            'Deseja realmente zerar o contador?\nEsta ação não poderá ser desfeita!!!',
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: zerar,
                              child: const Text('ZERAR'),
                            ),
                          ],
                        ),
                      ),
              child: const Text('Zerar'),
            ),
          ],
        ),
      ),
    );
  }
}
