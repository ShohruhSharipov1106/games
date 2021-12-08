import 'package:games/constants/imports.dart';

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  bool xMi = true;
  bool winner = false;
  List<String> belgilar = List.generate(9, (index) => "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const Text("Game Tic Tac Toe"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 500.0,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),
                      child: Text(
                        "${belgilar[index]}",
                        style: const TextStyle(fontSize: 100.0),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        if (xMi) {
                          belgilar[index] = "X";
                          xMi = !xMi;
                        } else {
                          belgilar[index] = "O";
                          xMi = !xMi;
                        }
                        for (var j = 0; j < 9; j += 3) {
                          if (belgilar[j] == belgilar[j + 1] &&
                              belgilar[j + 1] == belgilar[j + 2] &&
                              belgilar[j + 2] != '') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  belgilar[j],
                                ),
                              ),
                            );
                          }
                        }
                        for (var j = 0; j < 3; j += 1) {
                          if (belgilar[j] == belgilar[j + 3] &&
                                  belgilar[j + 3] == belgilar[j + 6] &&
                                  belgilar[j + 6] != '' ||
                              !winner) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  belgilar[j],
                                ),
                              ),
                            );
                          }
                        }
                        if (belgilar[0] == belgilar[4] &&
                                belgilar[4] == belgilar[8] &&
                                belgilar[8] != '' ||
                            !winner) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultPage(
                                belgilar[4],
                              ),
                            ),
                          );
                        } else if (belgilar[2] == belgilar[4] &&
                                belgilar[4] == belgilar[6] &&
                                belgilar[6] != '' ||
                            !winner) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultPage(
                                belgilar[2],
                              ),
                            ),
                          );
                        } else if (belgilar[0] != '' &&
                            belgilar[1] != '' &&
                            belgilar[2] != '' &&
                            belgilar[3] != '' &&
                            belgilar[4] != '' &&
                            belgilar[5] != '' &&
                            belgilar[6] != '' &&
                            belgilar[7] != '' &&
                            belgilar[8] != '' &&
                            winner) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.SUCCES,
                            animType: AnimType.SCALE,
                            title: "DURANG",
                            desc: "Afsuski o'yinda G'OLIB aniqlanmadi !!!",
                            btnCancelOnPress: () {
                              setState(() {
                                belgilar = List.generate(9, (index) => "");
                              });
                            },
                            btnOkOnPress: () {
                              setState(() {
                                belgilar = List.generate(9, (index) => "");
                              });
                            },
                          )..show();
                        }
                      });
                    },
                  );
                },
                itemCount: 9,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    belgilar = List.generate(9, (index) => "");
                  });
                },
                child: const Text(
                  "RESTART GAME",
                  style: TextStyle(fontSize: 28.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
