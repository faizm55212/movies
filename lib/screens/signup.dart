import 'package:flutter/material.dart';
import 'package:movies/controllers/drop_controller.dart';
import 'package:movies/controllers/user_controller.dart';
import 'package:movies/models/user.dart';
import 'package:get/get.dart';

DropController dropController = DropController();
final userController = Get.find<UserController>();
final newUser = User();

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: SizedBox(
                  width: 30.0,
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30.0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Text(
                'Create Your Account',
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Name',
                style: TextStyle(
                    color: Color(0xFF707070),
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0),
              ),
              Container(
                height: 40.0,
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  onChanged: (value) {
                    newUser.name = value;
                  },
                  cursorColor: Colors.yellow,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5.0),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xE3E3E3E3),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xE3E3E3E3),
                        width: 2.0,
                      ),
                    ),
                    hintText: 'John',
                    hintStyle: TextStyle(
                      color: Color(0xFF9E9D9D),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Password',
                style: TextStyle(
                    color: Color(0xFF707070),
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0),
              ),
              Container(
                height: 40.0,
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  onChanged: (value) {
                    newUser.password = value;
                  },
                  cursorColor: Colors.yellow,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5.0),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xE3E3E3E3),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xE3E3E3E3),
                        width: 2.0,
                      ),
                    ),
                    hintText: '***********',
                    hintStyle: TextStyle(
                      color: Color(0xFF9E9D9D),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Email',
                style: TextStyle(
                    color: Color(0xFF707070),
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0),
              ),
              Container(
                height: 40.0,
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  onChanged: (value) {
                    newUser.email = value;
                  },
                  cursorColor: Colors.yellow,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5.0),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xE3E3E3E3),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xE3E3E3E3),
                        width: 2.0,
                      ),
                    ),
                    hintText: 'googler@gmail.com',
                    hintStyle: TextStyle(
                      color: Color(0xFF9E9D9D),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Phone Number',
                style: TextStyle(
                    color: Color(0xFF707070),
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0),
              ),
              Container(
                height: 40.0,
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  onChanged: (value) {
                    newUser.phone = int.parse(value);
                  },
                  cursorColor: Colors.yellow,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5.0),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xE3E3E3E3),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xE3E3E3E3),
                        width: 2.0,
                      ),
                    ),
                    hintText: 'xxxxxxxx10',
                    hintStyle: TextStyle(
                      color: Color(0xFF9E9D9D),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Profession',
                style: TextStyle(
                    color: Color(0xFF707070),
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0),
              ),
              Obx(() => DropdownButton(
                    onChanged: (newValue) {
                      dropController.setSelected(newValue.toString());
                      newUser.profession = dropController.selected.value;
                    },
                    value: dropController.selected.value,
                    isExpanded: true,
                    items: dropController.listType.map((selectedType) {
                      return DropdownMenuItem(
                        child: new Text(
                          selectedType,
                        ),
                        value: selectedType,
                      );
                    }).toList(),
                  )),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 50.0,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: MaterialButton(
                    elevation: 2.0,
                    onPressed: () {
                      userController.addPassword(newUser);
                      Get.back();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: <Color>[
                            Color(0xFFFF5D5D),
                            Color(0xFF9C0101),
                            Color(0xFF630700),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(
                            minWidth: 88.0,
                            minHeight: 40.0), // min sizes for Material buttons
                        alignment: Alignment.center,
                        child: const Text(
                          'Save and use',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ])
          ]),
        ),
      ),
    );
  }
}
