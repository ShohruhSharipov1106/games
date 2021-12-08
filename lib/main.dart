import 'package:games/constants/imports.dart';
import 'package:games/screens/games_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Games',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:GameList(),
    );
  }
}
