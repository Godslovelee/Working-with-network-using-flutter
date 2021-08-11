import 'dart:async';
import 'package:chopper/chopper.dart';


class HeaderInterceptor implements RequestInterceptor {

  static const String AUTH_HEADER = "Authorization";

  static const String BEARER = "Bearer ";

  static const String V4_AUTH_HEADER =
      "< eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzMTliMDY2ZTIzOThlMDE1NjNkOTNjNmZjNzUyMjMxYiIsInN1YiI6IjYwZWNiNTk1ZTAwNGE2MDAzMDdhOTlhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MONwjGjCLhXuCqThtblDyUZQQbEln4unkxeSz8C3T4Q >";

  @override
  FutureOr<Request> onRequest(Request request) async {
    Request newRequest = request.copyWith(
        headers: {AUTH_HEADER: BEARER + V4_AUTH_HEADER});
    return newRequest;
  }
}
