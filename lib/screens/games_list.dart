import 'package:games/constants/imports.dart';

class GameList extends StatelessWidget {
  const GameList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Games List"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.03,
          horizontal: MediaQuery.of(context).size.width * 0.02,
        ),
        child: ListView.builder(
          itemExtent: 60.0,
          itemCount: Game().gameTitle.length,
          itemBuilder: (context, index) => ListTile(
            leading: Game().gameLeading[index],
            title: Text(
              Game().gameTitle[index],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 28.0,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Game().gamePage[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
