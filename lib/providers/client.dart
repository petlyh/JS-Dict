import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:jsdict/packages/jisho_client/jisho_client.dart";

final clientProvider = Provider((_) => JishoClient());
