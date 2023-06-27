import "dart:io";

class NotFoundException implements HttpException {
  @override
  final Uri? uri;
  @override
  String get message => "Not Found: ${Uri.decodeFull(uri.toString())}";

  @override
  String toString() => message;

  NotFoundException(this.uri);
}