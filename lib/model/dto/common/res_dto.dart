class ResDto<T> {
  final int code;
  final String message;
  final T? result;

  ResDto({
    this.code = -1,
    this.message = "예기치 못한 에러가 발생했습니다.",
    this.result,
  });
}
