import 'package:cupertino/data/services/rickAndMorty.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino/domain/models/character.model.dart';
import 'package:cupertino/ui/pages/characters/widgets/character.card.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  Widget build(BuildContext context) {
    RickAndMortyService service = RickAndMortyService();
    Future<dynamic> futureCharacters = service.fetch();

    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Rick & Morty API'),
        ),
        child: FutureBuilder<dynamic>(
          future: futureCharacters,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final items = snapshot.data!;
              return CupertinoScrollbar(
                thickness: 12,
                radius: const Radius.circular(10),
                thicknessWhileDragging: 8,
                //thumbVisibility: true,
                child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildItem(context, items[index]);
                    }),
              );
            } else {
              return const Center(
                child: Text('Error...'),
              );
            }
          },
        ));
  }

  Widget _buildItem(BuildContext context, dynamic res) {
    Character character = Character.fromMap(res);
    return CharacterCard(character: character);
  }
}
