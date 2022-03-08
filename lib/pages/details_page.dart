import 'package:flutter/material.dart';
import 'package:kode_start_rick_and_morty/components/app_bar_components.dart';
import 'package:kode_start_rick_and_morty/components/detailed_characters_card.dart';
import 'package:kode_start_rick_and_morty/data/respository.dart';
import 'package:kode_start_rick_and_morty/models/detailed_character.dart';
import 'package:kode_start_rick_and_morty/theme/app_colors.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({required this.characterId, Key? key}) : super(key: key);

  final int characterId;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Future<DetailedCharacter>? detailedCharacter;

  @override
  initState() {
    detailedCharacter = Repository.getCharacterDetails(widget.characterId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context, isSecondPage: true),
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder(
        future: detailedCharacter,
        builder: (context, AsyncSnapshot<DetailedCharacter> snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView(
              children: [
                DetailedCharacterCard(detailedCharacter: data),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Ocorreu um erro.',
                style: TextStyle(color: AppColors.white),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
