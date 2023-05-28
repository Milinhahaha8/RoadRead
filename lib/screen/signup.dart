import 'package:flutter/material.dart';
import 'package:roadread/main.dart';
import 'package:roadread/Model/UserModel.dart';
import 'package:roadread/DatabaseHandler/DbHelper.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DbHelper dbHelper = new DbHelper();
    final TextEditingController user = TextEditingController();
    final TextEditingController password = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFF11111F),
      appBar: AppBar(
        title: const Text('Cadastro'),
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
                    'Crie sua conta!',
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
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 1, left: 20),
                            child: TextField(
                              controller: user,
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
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 1, left: 20),
                            child: TextField(
                              controller: password,
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
                          var userText = user.text.toString();
                          var passText = password.text.toString();
                          UserModel uModel = UserModel(
                              userText, "test", "test@gmail.co,", passText);
                          dbHelper.saveData(uModel);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyLoginPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF8F1C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: const Text(
                          'Criar',
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
