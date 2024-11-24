import "package:flutter/material.dart";
import "package:get_it/get_it.dart";
import "package:jsdict/packages/jisho_client/jisho_client.dart";

Future<void> registerSingletons() async {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.I.registerLazySingleton<JishoClient>(JishoClient.new);

  return await GetIt.I.allReady();
}

JishoClient getClient() => GetIt.I<JishoClient>();
