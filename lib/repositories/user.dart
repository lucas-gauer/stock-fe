import '../services/api.dart';

class UserRepository {
  static Future<void> create(String name, String password) async {
    Map body = {"name": name, "password": password};
    await api.post("/user/", body);
  }
}
