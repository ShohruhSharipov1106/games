import 'package:games/constants/imports.dart';

class TappingGame extends StatefulWidget {
  @override
  _TappingGameState createState() => _TappingGameState();
}

class _TappingGameState extends State<TappingGame> {
  int a = 20;
  int b = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Tapping Game",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                a = 20;
                b = 20;
              });
            },
            icon: const Icon(
              Icons.refresh_outlined,
              color: Colors.black,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.85,
          width: MediaQuery.of(context).size.width * 0.98,
          child: Column(
            children: [
              Expanded(
                flex: a,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      a = a + 1;
                      b = b - 1;
                      debugPrint("${a}");
                      if (a == 40) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.SUCCES,
                          animType: AnimType.SCALE,
                          title: "Tabriklaymiz",
                          desc: "Ko'k - o'yinchi o'yinda G'ALABA qozondi !!!",
                          btnCancelOnPress: () {
                            setState(() {
                              a = 20;
                              b = 20;
                            });
                          },
                          btnOkOnPress: () {
                            setState(() {
                              a = 20;
                              b = 20;
                            });
                          },
                        )..show();
                      }
                    });
                  },
                  child: Container(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              Expanded(
                flex: b,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      a = a - 1;
                      b = b + 1;
                      debugPrint("${b}");
                      if (b == 40) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.SUCCES,
                          animType: AnimType.SCALE,
                          title: "Tabriklaymiz",
                          desc: "Qizil - o'yinchi o'yinda G'ALABA qozondi !!!",
                          btnCancelOnPress: () {
                            setState(() {
                              a = 20;
                              b = 20;
                            });
                          },
                          btnOkOnPress: () {
                            setState(() {
                              a = 20;
                              b = 20;
                            });
                          },
                        )..show();
                      }
                    });
                  },
                  child: Container(
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
