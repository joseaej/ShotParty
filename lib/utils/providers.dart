import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shotparty/models/providers/player_provider.dart';

final List<SingleChildWidget> constProvidersDef = [
  ChangeNotifierProvider(create: (context) => PlayerProvider()),
];
