class NetworkException implements Exception {
  const NetworkException([this.code, this.message]);

  final String? code;
  final String? message;

  @override
  String toString() => 'Network Exception $code: ${message ?? 'Error unknown'}';
}
