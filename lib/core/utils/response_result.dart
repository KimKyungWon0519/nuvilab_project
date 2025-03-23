class ResponseResult<T> {
  final T? data;
  final String? error;

  ResponseResult({
    this.data,
    this.error,
  });

  ResponseResult.success(this.data) : error = null {
    assert(data != null, '성공 시 데이터는 NULL이 될 수 없습니다.');
  }

  ResponseResult.error(this.error) : data = null {
    assert(error != null && error!.isNotEmpty, '에러 시 에러메시지가 필요합니다.');
  }

  bool get isSuccess => data != null;
  bool get isError => error != null;
}
