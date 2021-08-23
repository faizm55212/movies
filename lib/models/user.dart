import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String name;
  @HiveField(1)
  String password;
  @HiveField(2)
  String email;
  @HiveField(3)
  int phone;
  @HiveField(4)
  String profession;

  User({
    this.name,
    this.password,
    this.email,
    this.phone,
    this.profession,
  });
}
