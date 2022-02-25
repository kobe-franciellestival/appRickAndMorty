import 'package:flutter/material.dart';
import 'package:kode_start_rick_and_morty/models/paginated_characters.dart';
import 'package:kode_start_rick_and_morty/theme/app_colors.dart';

class CharactersCard extends StatelessWidget {
  const CharactersCard({Key? key, required this.character, required this.onTap})
      : super(key: key);

  final Character character;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: AppColors.primaryColorLight,
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: InkWell(
          highlightColor: AppColors.primaryColorDark,
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Image.network(
                  character.image,
                  height: 150.0,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "${character.name.toUpperCase()} ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
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
