import 'package:flutter/material.dart';
//import 'package:cli_util/cli_logging.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:working_with_network/models/model_list.dart';
import 'package:working_with_network/services/movie_service_api.dart';


void main() {
    _okayLogging();
    runApp(MyApp());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
    create: (_) =>  MovieService.create(),
    dispose: (_, MovieService service) => service.client.dispose(),
      child: MaterialApp(
    title: "Network Demo",
    theme: ThemeData(
    primarySwatch: Colors.blue,

    ),

    ));

  }
}
void _okayLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}