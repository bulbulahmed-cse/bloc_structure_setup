abstract class StorageService {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<String> getLanguage();
  Future<void> setLanguage(String language);
  Future<void> clear();
}