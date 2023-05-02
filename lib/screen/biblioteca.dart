import 'package:flutter/material.dart';

class MyLibraryPage extends StatelessWidget {
  const MyLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF11111F),
      appBar: AppBar(
        title: const Text('Biblioteca'),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 41),
            decoration: const BoxDecoration(
              color: Color(0xFF11111F),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFFF8F1C),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 13),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Pesquisar na Biblioteca',
                          hintStyle: TextStyle(color: Color(0xFF11111F)),
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFF11111F)),
                      ),
                    ),
                  ),
                  IconButton(
                      icon: const Icon(Icons.search, color: Color(0xFF11111F)),
                      onPressed: () {
                        // Adicione a ação desejada quando o botão de pesquisa for pressionado
                      },
                      padding: const EdgeInsets.only(bottom: 1)),
                ],
              ),
            ),
          ),
          Container(
            height: 30,
            alignment: Alignment.center,
            child: const Text(
              'Minha Biblioteca',
              style: TextStyle(
                color: Color(0xFFFF8F1C),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
