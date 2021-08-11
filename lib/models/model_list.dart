
import 'package:json_annotation/json_annotation.dart';
import 'package:logging/logging.dart';

// 2 
part 'model_list.g.dart';

// 3



void _okayLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

@JsonSerializable()
class ModelList {
  // 4
  double popularity;
  // 5
  @JsonKey(name: 'vote_count')
  int voteCount;
  @JsonKey(name: 'video')
  bool video;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'adult')
  bool adult;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  @JsonKey(name: 'original_title')
  String originalTitle;
  @JsonKey(name: 'genre_ids')
  List<int> genreIds;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'overview')
  String overview;
  @JsonKey(name: 'release_date')
  String releaseDate;

  // 6
  ModelList({this.popularity, this.voteCount, this.video, this.posterPath, this.id,
    this.adult, this.backdropPath, this.originalLanguage, this.originalTitle,
    this.genreIds, this.title, this.voteAverage, this.overview,
    this.releaseDate});

  // 7
  factory ModelList.fromJson(Map<String, dynamic> json) => _$ModelListFromJson(json);

  // 8
  Map<String, dynamic> toJson() => _$ModelListToJson(this);
}
