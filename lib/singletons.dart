import 'package:get_it/get_it.dart';
import 'package:jsdict/client/client.dart';

void setClient() {
  GetIt.I.registerLazySingleton<JishoClient>(() => JishoClient());
}

JishoClient getClient() {
  return GetIt.I<JishoClient>();
}