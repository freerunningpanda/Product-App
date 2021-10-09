class FakeStoreException implements Exception {
  final String? msg;
  const FakeStoreException([this.msg]);

  @override
  String toString() {
    return msg ?? 'FakeStoreException';
  }
}