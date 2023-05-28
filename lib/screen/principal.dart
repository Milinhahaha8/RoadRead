import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:roadread/screen/biblioteca.dart';
import 'package:file_picker/file_picker.dart';
//import 'package:flutter_tts/flutter_tts.dart';

class MyMainPage extends StatelessWidget {
  const MyMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF8F1C),
      appBar: AppBar(
        title: const Text('Tela Principal'),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 2 / 5,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFF11111F),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      2 /
                      5 *
                      0.7, // 60% da altura do container pai
                  child: Image.asset(
                    'assets/images/logo2.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Para a geração de áudio é necessário selecionar um'
                      ' arquivo no seu dispositivo ou até mesmo na nuvem',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFFF8F1C),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            height: MediaQuery.of(context).size.height * 0.15,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //botão de arquivo local
                    //SizedBox(
                    //width: MediaQuery.of(context).size.width * 0.4,
                    // height: MediaQuery.of(context).size.width * 0.2,
                    //     child: ElevatedButton(
                    //     onPressed: () async {
                    //FlutterTts flutterTts = FlutterTts();
                    //flutterTts.speak("chanana nanana");
                    //   print("chanana nanana1");
                    // Seleciona um arquivo local
                    //     FilePickerResult? result =
                    //        await FilePicker.platform.pickFiles(
                    //      type: FileType.any,
                    //   );
                    //   print("chanana nanana2");
                    //  if (result != null) {
                    //    print("chanana nanana3");
                    //    // Obtém o caminho do arquivo selecionado
                    //    String filePath = result.files.single.path!;
                    // Lê o conteúdo do arquivo como texto
                    //    var text = await File(filePath)
                    //        .readAsString(encoding: utf8);
                    //   print("AAAAH -> " + text);
                    // Converte o texto em áudio
                    //flutterTts.speak(text);
                    // }
                    //  },
                    //   child: const Text(
                    //    'Selecione arquivo local',
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 16,
                    //    fontWeight: FontWeight.bold,
                    //    color: Color(0xFFFF8F1C),
                    //     ),
                    //   ),
                    //   ),
                    //  ),

                    //botão de seleção do arquivo
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.width * 0.2,
                      child: ElevatedButton(
                        //Seleciona o arquivo
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                            type: FileType.any,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF11111F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: const Text(
                          'Selecione um arquivo',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF8F1C),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Lembre-se, apenas arquivos .pdf, .doc e .docx',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF11111F),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: const Color(0xFF11111F),
            height: MediaQuery.of(context).size.width * 0.532,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.532,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: const BoxDecoration(
                    color: Color(0xFF11111F),
                    border: Border(
                      left: BorderSide(width: 1, color: Color(0xFFFF8F1C)),
                      right: BorderSide(width: 1, color: Color(0xFFFF8F1C)),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 85, horizontal: 50),
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.width * 0.1,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyLibraryPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF8F1C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text(
                        'Biblioteca',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF11111F),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
