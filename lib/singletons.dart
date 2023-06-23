import 'package:get_it/get_it.dart';
import 'package:jsdict/packages/jisho_client/jisho_client.dart';

void setClient() {
  GetIt.I.registerLazySingleton<JishoClient>(() => JishoClient());
}

JishoClient getClient() {
  return GetIt.I<JishoClient>();
}