import "package:chopper/chopper.dart";
import 'package:working_with_network/models/model_list.dart';
import 'package:working_with_network/models/movie_list.dart';
import 'Our_json_converter.dart';

part 'movie_service_api.chopper.dart';


//@ChopperService()
@ChopperApi()

abstract class MovieService extends ChopperService{
    @Get(path: 'movie/popular')

    Future<Response<MovieStreamList>> getPopularMovies();

    // 8
    static MovieService create() {
      // 9
      final client = ChopperClient(
        // 10
        baseUrl: 'https://api.themoviedb.org/3',
        interceptors: [HttpLoggingInterceptor()],
        converter: ModelConverter(),
        errorConverter: JsonConverter(),

        // 11
        services: [
          _$MovieService(),
        ],
      );
      // 12
      return _$MovieService(client);
    }
}