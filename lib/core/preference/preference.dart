abstract class Preference {
  Future<void> savePrefString(String key, String valueString);
  Future<String> getPrefString(String key);
  Future<void> clearAll();
}