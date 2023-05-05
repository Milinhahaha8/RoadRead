import 'package:flutter/material.dart';
import 'package:roadread/Model/UserModel.dart';
import 'package:roadread/screen/principal.dart';
import 'package:roadread/DatabaseHandler/DbHelper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyLoginPage(),
    );
  }
}

class MyLoginPage extends StatelessWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DbHelper dbHelper = new DbHelper();

    return Scaffold(
      backgroundColor: const Color(0xFF11111F),
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            color: const Color(0xFFFF8F1C),
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              //linhas dos lados
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: const BoxDecoration(
                color: Color(0xFF11111F),
                border: Border(
                  left: BorderSide(width: 1, color: Color(0xFFFF8F1C)),
                  right: BorderSide(width: 1, color: Color(0xFFFF8F1C)),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Bem vindo ao RoadRead',
                    style: TextStyle(
                      color: Color(0xFFFF8F1C),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 14),
                  //Usuário
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.width * 0.1,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF8F1C),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 1, left: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Usuário',
                                hintStyle: TextStyle(color: Color(0xFF11111F)),
                                border: InputBorder.none,
                              ),
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Color(0xFF11111F)),
                            ),
                          ),
                        ),
                        IconButton(
                            icon: const Icon(Icons.person,
                                color: Color(0xFF11111F)),
                            onPressed: () {
                              UserModel uModel = UserModel(
                                  "123", "test", "test@gmail.co,", "123test");
                              dbHelper.saveData(uModel);
                              //Se quiser que o ícone de usuário faça algo
                            },
                            padding: const EdgeInsets.only(bottom: 1)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.width * 0.1,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF8F1C),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    //Senha
                    child: Row(
                      children: [
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 1, left: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Senha',
                                hintStyle: TextStyle(color: Color(0xFF11111F)),
                                border: InputBorder.none,
                              ),
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Color(0xFF11111F)),
                            ),
                          ),
                        ),
                        IconButton(
                            icon: const Icon(Icons.password,
                                color: Color(0xFF11111F)),
                            onPressed: () {
                              //Se quiser que o ícone de senha faça algo
                            },
                            padding: const EdgeInsets.only(bottom: 1)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.width * 0.1,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyMainPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF8F1C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF11111F),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  GestureDetector(
                    onTap: () {
                      // Aqui você pode adicionar a lógica para abrir o link desejado
                      // por exemplo, utilizando o pacote url_launcher
                    },
                    child: const Text(
                      'Crie sua conta aqui',
                      style: TextStyle(
                        color: Color(0xFFFF8F1C),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 14),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyMainPage()),
                      );
                    },
                    child: const Text(
                      'Ou entre como convidado!',
                      style: TextStyle(
                        color: Color(0xFFFF8F1C),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
