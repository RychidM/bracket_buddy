
abstract class DbServiceAdaptor<T> {
  Future<void> createRecord(T record);

  Future<void> createMultiRecords(List<T> records);

  Future<T?> getRecordById(int id);

  Future<List<T?>> getRecordsByIds(List<int> ids);

  Future<List<T>> getAllRecords();

  Future<void> updateRecord(T record);

  Future<void> deleteRecord(int id);

  Future<void> deleteMultiRecords(List<int> ids);
}
