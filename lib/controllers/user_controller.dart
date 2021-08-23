import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:movies/models/user.dart';
import 'package:movies/controllers/encrypter.dart';

final EncryptService _encryptService = new EncryptService();

class UserController extends GetxController {
  List<User> _users;
  Box<User> _userBox;
  List<User> get users => _users;

  UserController() {
    _userBox = Hive.box<User>('users');
    _users = [];
    for (int i = 0; i < _userBox.values.length; i++) {
      _users.add(_userBox.getAt(i));
    }
  }

  addPassword(User user) {
    final newUser = User(
      name: user.name.toLowerCase(),
      password: _encryptService.encrypt(user.password),
      email: user.email.toLowerCase(),
      phone: user.phone,
      profession: user.profession,
    );
    _userBox.add(newUser);
    update();
  }

  int verify(String nameP, String passwordP) {
    int index = _users.indexWhere((user) => user.name.toLowerCase() == nameP);

    if (index == -1) {
      return 1;
    } else if (passwordP ==
        _encryptService.decrypted(_userBox.getAt(index).password)) {
      return 0;
    } else {
      return 2;
    }
  }
}
