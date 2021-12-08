import 'package:games/constants/imports.dart';

class ResultPage extends StatelessWidget {
  String winner;
  ResultPage(this.winner);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: AlertDialog(
        title: const Text("Congratulations"),
        content: Text(
          winner == "X" ? "Winner: X Player" : "Winner: O Player",
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.transparent),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.cancel_outlined,
                      color: Colors.red,
                      size: 24.0,
                    ),
                    Text(
                      "Exit",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.transparent),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.change_circle_outlined,
                      color: Colors.blue,
                      size: 24.0,
                    ),
                    Text(
                      "Refresh",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
