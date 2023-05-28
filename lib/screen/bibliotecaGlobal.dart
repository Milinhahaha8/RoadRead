import 'package:flutter/material.dart';
import 'package:roadread/screen/biblioteca.dart';

class LibraryGlobalPage extends StatelessWidget {
  const LibraryGlobalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF11111F),
      appBar: AppBar(
        title: const Text('Biblioteca Global'),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 41),
            decoration: const BoxDecoration(
              color: Color(0xFF11111F),
            ),
            //Barra de pesquisa e botão para biblioteca global
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 10 - 9,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF8F1C),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_rounded,
                        color: Color(0xFF11111F)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyLibraryPage()),
                      );
                    },
                    padding: const EdgeInsets.only(bottom: 1),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF8F1C),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, top: 12),
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: 'Pesquisar',
                                hintStyle: TextStyle(color: Color(0xFF11111F)),
                                border: InputBorder.none,
                              ),
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Color(0xFF11111F)),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10, top: 5),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(Icons.search, color: Color(0xFF11111F)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Título da página
          Container(
            height: 30,
            alignment: Alignment.center,
            child: const Text(
              'Biblioteca Global',
              style: TextStyle(
                color: Color(0xFFFF8F1C),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //Conteúdo da página
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 41),
              decoration: const BoxDecoration(
                color: Color(0xFF11111F),
                border: Border(
                  left: BorderSide(width: 1, color: Color(0xFFFF8F1C)),
                  right: BorderSide(width: 1, color: Color(0xFFFF8F1C)),
                ),
              ),
              child: Expanded(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF8F1C),
                  ),
                  child: Table(
                    border: TableBorder.symmetric(
                      inside:
                          const BorderSide(width: 1, color: Color(0xFF11111F)),
                    ),
                    children: [
                      // Cabeçalho da tabela
                      const TableRow(
                        decoration: BoxDecoration(
                          color: Color(0xFFFF8F1C),
                        ),
                        children: [
                          TableCell(
                            child: Text(
                              'Nome',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Text(
                              'Tamanho',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Text(
                              'Exclusão',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Linhas da tabela
                      TableRow(
                        children: [
                          const TableCell(
                            child: Text('Arquivo 1'),
                          ),
                          const TableCell(
                            child: Text('10 MB'),
                          ),
                          TableCell(
                            child: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                // Adicione aqui a função para excluir a linha da tabela
                              },
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const TableCell(
                            child: Text('Arquivo 2'),
                          ),
                          const TableCell(
                            child: Text('5 MB'),
                          ),
                          TableCell(
                            child: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                // Adicione aqui a função para excluir a linha da tabela
                              },
                            ),
                          ),
                        ],
                      ),
                      // Adicione mais linhas conforme necessário
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
