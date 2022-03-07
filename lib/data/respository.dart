import 'package:dio/dio.dart';
import 'package:kode_start_rick_and_morty/models/detailed_character.dart';
import 'package:kode_start_rick_and_morty/models/detailed_episode.dart';
import 'package:kode_start_rick_and_morty/models/paginated_characters.dart';

abstract class Repository {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: "https://rickandmortyapi.com/api",
    ),
  );

  static Future<PaginatedCharacters> getAllCharacters() async {
    var response = await _dio.get("/character");
    return PaginatedCharacters.fromJson(response.data);
  }

  static Future<DetailedCharacter> getCharacterDetails(int characterId) async {
    var response = await _dio.get("/character/$characterId");
    return DetailedCharacter.fromJson(response.data);
  }

  static Future<Episode> getEpisodeDetails(int episodeId) async {
    var response = await _dio.get("/episode/$episodeId");
    return Episode.fromJson(response.data);
  }

  static Future<Episode> filterCharacter(String nameValue) async {
    var response = await _dio.get("/episode/?name=$nameValue");
    return Episode.fromJson(response.data);
  }
}
