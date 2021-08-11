import 'package:chopper/chopper.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logging/logging.dart';
import 'model_list.dart';

part 'movie_list.g.dart';
//@ChopperApi()
@JsonSerializable()
class MovieStreamList {
  int page;
  @JsonKey(name: 'total_results')
  int totalResults;
  @JsonKey(name: 'total_pages')
  int totalPages;
  List<ModelList> results;

  MovieStreamList({this.page, this.totalResults, this.totalPages,  this.results});
  factory MovieStreamList.fromJson(Map<String, dynamic> json) => _$MovieStreamListFromJson(json);

  Map<String, dynamic> toJson() => _$MovieStreamListToJson(this);

}
