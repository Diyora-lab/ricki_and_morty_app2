class BaseResponse<T> {
  final int statusCode;
  final String message;
  final T data;

  BaseResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  void resolve(
      {required Function(T data) onSucceed,
      required Function(String message) onFailed}) {
    if (data != null) {
      onSucceed(data);
    } else {
      onFailed(message);
    }
  }
}
