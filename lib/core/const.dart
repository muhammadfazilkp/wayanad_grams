import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:zudocoz/controller/creating_nots/login_provider/sign_up.dart';
import 'package:zudocoz/controller/creating_nots/notes.dart';

const String appName = 'ZUDOCOS';
const String search = "Search Prodects";
List<SingleChildWidget> providers = [...independentServices];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider(create: (context) => LocalDatas()),
  ChangeNotifierProvider(create: (context) => SignUpMeathods())
];
