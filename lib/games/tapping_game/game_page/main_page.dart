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
      backgroundColor: Colors.white,
      appBar: _setAppBar(),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.85,
          width: MediaQuery.of(context).size.width * 0.98,
          child: Column(
            children: [
              Expanded(
                flex: a,
                child: InkWell(
                  onTap: () {
                    setState(
                      () {
                        a = a + 1;
                        b = b - 1;
                        if (a == 40) {
                          setState(() {
                            a = 20;
                            b = 20;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultPage("a"),
                            ),
                          );
                        }
                      },
                    );
                  },
                  child: Container(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              Expanded(
                flex: b,
                child: InkWell(
                  onTap: () {
                    setState(
                      () {
                        a = a - 1;
                        b = b + 1;
                        if (b == 40) {
                          setState(() {
                            a = 20;
                            b = 20;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultPage("b"),
                            ),
                          );
                        }
                      },
                    );
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

  AppBar _setAppBar() => AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Tapping Game",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
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
      );
}
