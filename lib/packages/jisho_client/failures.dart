import "package:http/http.dart";

sealed class Failure implements Exception {}

class ExtractionFailure extends Failure {
  ExtractionFailure(this.itemType);

  final String itemType;

  @override
  String toString() => "Failed to extract $itemType info";
}

class NotFoundFailure extends Failure {
  @override
  String toString() => "Could not find item";
}

sealed class HttpFailure extends Failure {}

class HttpRequestFailure extends HttpFailure {
  HttpRequestFailure(this.causeObject, this.stackTrace);

  final Object causeObject;
  final StackTrace stackTrace;

  @override
  String toString() => "Network request failed: $causeObject";
}

class HttpReponseFailure extends HttpFailure {
  HttpReponseFailure(this.response);

  final Response response;

  @override
  String toString() =>
      "Server responded with an error-range status code: ${response.statusCode} ${response.reasonPhrase}";
}
