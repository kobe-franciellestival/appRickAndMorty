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
  int currentPage = 1;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    characters = Repository.getAllCharacters(currentPage);
    scrollController.addListener(onScroll);
    super.initState();
  }

  void onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        currentPage++;
        characters = Repository.getAllCharacters(currentPage);
      });
    }
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
