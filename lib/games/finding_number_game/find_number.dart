import 'package:games/constants/imports.dart';

class Find_Number extends StatefulWidget {
  @override
  _Find_NumberState createState() => _Find_NumberState();
}

class _Find_NumberState extends State<Find_Number> {
  int randomSon = 1 + Random().nextInt(12);
  List<bool> listholati = List.generate(12, (index) => true);
  int time = 10;
  int urinishlar = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text("Finding Number"),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                randomSon = 1 + Random().nextInt(12);
                listholati = List.generate(12, (index) => true);
                urinishlar = 3;
              });
            },
            icon: const Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 600.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
                vertical: 50.0,
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return CircleAvatar(
                    backgroundColor:
                        listholati[index] ? Colors.green : Colors.red,
                    child: TextButton(
                      onPressed: listholati[index]
                          ? () {
                              if (urinishlar - 1 == 0) {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.ERROR,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: "Game Over",
                                  desc: "You LOSE !!!",
                                  btnCancelOnPress: () {
                                    setState(() {
                                      randomSon = 1 + Random().nextInt(12);
                                      listholati =
                                          List.generate(12, (index) => true);
                                      urinishlar = 3;
                                    });
                                  },
                                  btnOkOnPress: () {
                                    setState(() {
                                      randomSon = 1 + Random().nextInt(12);
                                      listholati =
                                          List.generate(12, (index) => true);
                                      urinishlar = 3;
                                    });
                                  },
                                )..show();
                              } else {
                                setState(() {
                                  debugPrint(urinishlar.toString());
                                  urinishlar -= 1;
                                  if (randomSon > index + 1) {
                                    Fluttertoast.showToast(
                                        msg: "Random number is bigger",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    for (var i = 0; i < index + 1; i++) {
                                      setState(
                                        () {
                                          listholati[i] = false;
                                        },
                                      );
                                    }
                                  } else if (randomSon < index + 1) {
                                    Fluttertoast.showToast(
                                        msg: "Random number is smaller",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    for (var i = index; i < 12; i++) {
                                      setState(
                                        () {
                                          listholati[i] = false;
                                        },
                                      );
                                    }
                                  } else {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.SUCCES,
                                      animType: AnimType.SCALE,
                                      title: "Congratulations",
                                      desc:
                                          "You FOUND it !!!. Random number is ${index + 1}",
                                      btnCancelOnPress: () {
                                        setState(() {
                                          randomSon = 1 + Random().nextInt(12);
                                          listholati = List.generate(
                                              12, (index) => true);
                                          urinishlar = 3;
                                        });
                                      },
                                      btnOkOnPress: () {
                                        setState(() {
                                          randomSon = 1 + Random().nextInt(12);
                                          listholati = List.generate(
                                              12, (index) => true);
                                          urinishlar = 3;
                                        });
                                      },
                                    )..show();
                                  }
                                });
                              }
                            }
                          : null,
                      child: Text(
                        "${index + 1}",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
