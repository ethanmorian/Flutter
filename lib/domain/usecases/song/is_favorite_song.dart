import 'package:flutter_spotify/core/usecase/usecase.dart';
import 'package:flutter_spotify/domain/repositories/song/song.dart';
import 'package:flutter_spotify/service_locator.dart';

class IsFavoriteSongUseCase implements UseCase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await sl<SongRepository>().isFavoriteSong(params!);
  }
}
