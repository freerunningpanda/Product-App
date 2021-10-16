class FakeStoreException implements Exception {
  String? msg;
  FakeStoreException([this.msg]);

  @override
  String toString() {
    return msg ?? 'FakeStoreException';
  }
}
