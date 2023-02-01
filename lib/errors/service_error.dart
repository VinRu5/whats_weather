class ServiceError extends Error {
  final String? message;

  ServiceError([
    this.message,
  ]);
}
