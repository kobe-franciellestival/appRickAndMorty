import 'package:flutter/material.dart';
import 'package:kode_start_rick_and_morty/components/app_bar_components.dart';
import 'package:kode_start_rick_and_morty/components/characters_card.dart';
import 'package:kode_start_rick_and_morty/data/respository.dart';
import 'package:kode_start_rick_and_morty/models/paginated_characters.dart';
import 'package:kode_start_rick_and_morty/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<PaginatedCharacters>? characters;

//tentei implementar a lista infita, mas não consegui.
// essa foi a forma que encontrei de consumir as outras pg da API

  @override
  void initState() {
    characters = Repository.getAllCharacters();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context),
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder(
          future: characters,
          builder: (context, AsyncSnapshot<PaginatedCharacters> snapshot) {
            if (snapshot.hasData) {
              final dataResults = snapshot.data!.results;
              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 7.5),
                itemBuilder: (context, index) {
                  return CharactersCard(
                    character: dataResults[index],
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/details',
                        arguments: dataResults[index].id,
                      );
                    },
                  );
                },
                itemCount: dataResults.length,
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Ocorreu um erro.",
                  style: TextStyle(color: AppColors.white),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
