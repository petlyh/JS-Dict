import 'inflection_types.dart';

export 'inflection_types.dart';

class Inflection {
  static InflectionType getType(String word, String typeId) {
    if (typeId == "vs-i") {
      if (word == "為る") {
        return SuruSpecial();
      }

      return SuruVerb(word);
    }

    if (typeId == "vk") {
      return Kuru();
    }

    if (typeId == "adj-i") {
      return IAdjective(word);
    }

    if (typeId == "v1") {
      return IchidanVerb(word);
    }

    if (typeId.startsWith("v5")) {
      return GodanVerb(word, typeId.substring(2));
    }

    throw Exception("Unknown inflection type: $typeId");
  }
}