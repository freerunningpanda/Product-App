class FakeStoreException implements Exception {
<<<<<<< HEAD
  String? msg;
  FakeStoreException([this.msg]);
=======
  final String? msg;
  const FakeStoreException([this.msg]);
>>>>>>> 6aaf49d50bc13fd275113aa5c012555584c58f6b

  @override
  String toString() {
    return msg ?? 'FakeStoreException';
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 6aaf49d50bc13fd275113aa5c012555584c58f6b
