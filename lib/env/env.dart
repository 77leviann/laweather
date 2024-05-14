import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'openWeatherMapApiKey')
  static const openWeatherMapApiKey = _Env.openWeatherMapApiKey;
}