import 'package:flutter/material.dart';
import 'package:roadread/main.dart';
import 'package:roadread/Model/UserModel.dart';
import 'package:roadread/DatabaseHandler/DbHelper.dart';

class RecuperarPage extends StatelessWidget {
  const RecuperarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DbHelper dbHelper = new DbHelper();
    final TextEditingController user = TextEditingController();
    final TextEditingController password = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFF11111F),
      appBar: AppBar(
        title: const Text('Recuperar Senha'),
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
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50, bottom: 50),
                    child: const Text(
                      'Recupere sua senha!',
                      style: TextStyle(
                        color: Color(0xFFFF8F1C),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  //Usuário
                  Center(
                    child: Container(
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
                              child: TextFormField(
                                controller: user,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'Usuário',
                                  hintStyle:
                                      TextStyle(color: Color(0xFF11111F)),
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
                              //test: save mock user when clicking this icon
                            },
                            padding: const EdgeInsets.only(bottom: 1),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  //Senha
                  Center(
                    child: Container(
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
                                controller: password,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Nova Senha',
                                  hintStyle:
                                      TextStyle(color: Color(0xFF11111F)),
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
                            padding: const EdgeInsets.only(bottom: 1),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),
                  //Botão de criaçao de conta
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.width * 0.1,
                      child: ElevatedButton(
                        onPressed: () async {
                          var userText = user.text.toString();
                          var passText = password.text.toString();
                          await dbHelper
                              .getLoginUser(userText, passText)
                              .then((UserData) {
                            print(UserData?.userID);
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyApp()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF8F1C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: const Text(
                          'Recuperar',
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
