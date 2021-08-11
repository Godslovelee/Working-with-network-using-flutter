// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieStreamList _$MovieStreamListFromJson(Map<String, dynamic> json) {
  return MovieStreamList(
    page: json['page'] as int,
    totalResults: json['total_results'] as int,
    totalPages: json['total_pages'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : ModelList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MovieStreamListToJson(MovieStreamList instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
      'results': instance.results,
    };
