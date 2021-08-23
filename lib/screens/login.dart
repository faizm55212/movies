import 'package:flutter/material.dart';
import 'package:movies/components/custom_icons.dart';
import 'package:get/get.dart';
import 'package:movies/controllers/text_controller.dart';
import 'package:movies/screens/home.dart';
import 'signup.dart';
import 'package:movies/controllers/user_controller.dart';

final userController = Get.find<UserController>();

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name, password;
    bool checkBoxValue = true;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back-red.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                ),
                Positioned(
                  top: 520,
                  left: MediaQuery.of(context).size.width / 9,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    height: 80.0,
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'No Registered Accounts yet?',
                              style: TextStyle(
                                  color: Color(0xFFADAAAA),
                                  fontWeight: FontWeight.w500),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(SignupPage());
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    color: Color(0xFFEB1D1D),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15.0),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 80.0,
                  left: MediaQuery.of(context).size.width / 21,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    elevation: 5.0,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0)),
                      height: 470.0,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            TextFormField(
                              controller: nameController,
                              onChanged: (value) {
                                name = nameController.text;
                              },
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                filled: true,
                                fillColor: Color(0xE3E3E3E3),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'John',
                                hintStyle: TextStyle(
                                    color: Color(0xFF9E9D9D),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            TextFormField(
                              controller: pswdController,
                              onChanged: (value) {
                                password = pswdController.text;
                              },
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16.0),
                                filled: true,
                                fillColor: Color(0xE3E3E3E3),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: '***********',
                                hintStyle: TextStyle(
                                    color: Color(0xFF9E9D9D),
                                    fontWeight: FontWeight.w600),
                              ),
                              obscureText: true,
                              validator: (val) {
                                if (val.trim().isEmpty) {
                                  return "Enter A Value !";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 42.0,
                                  width: 32.0,
                                  child: Checkbox(
                                    activeColor: Color(0xFF585858),
                                    value: checkBoxValue,
                                    onChanged: (value) {},
                                  ),
                                ),
                                Text(
                                  'Remember Me',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 25.0),
                            Center(
                              child: Container(
                                color: Color(0xFFD84848),
                                height: 3.0,
                                width: 150.0,
                              ),
                            ),
                            Center(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forget Password?',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15.0),
                                  )),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: MaterialButton(
                                elevation: 0.0,
                                onPressed: () {
                                  int ret = userController.verify(
                                      name.toLowerCase(), password);
                                  if (ret == 0) {
                                    Get.off(HomePage());
                                  } else if (ret == 1 || ret == 2) {
                                    Get.defaultDialog(
                                      title: 'Alert',
                                      content: Column(
                                        children: [
                                          Icon(
                                            Icons.error,
                                            color: Colors.red,
                                          ),
                                          SizedBox(height: 10.0),
                                          Text("Invalid Login"),
                                        ],
                                      ),
                                      confirm: MaterialButton(
                                        onPressed: () {
                                          nameController.text = '';
                                          pswdController.text = '';
                                          Get.back();
                                        },
                                        child: Text('Go Back'),
                                      ),
                                      barrierDismissible: false,
                                    );
                                  }
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(80.0)),
                                  ),
                                  child: Container(
                                    constraints: const BoxConstraints(
                                        minWidth: 88.0,
                                        minHeight:
                                            40.0), // min sizes for Material buttons
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Log In',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 630.0,
                  left: MediaQuery.of(context).size.width / 4.8,
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      customIconB(CustomIcons.twitter),
                      customIconB(CustomIcons.google_plus),
                      customIconB(CustomIcons.facebook),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -90.0,
            right: 30.0,
            child: Container(
              width: 130.0,
              height: 300.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/hanging-lamp.png'),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Container customIconB(IconData iconName) {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(
            width: 2.0,
            color: Colors.white,
          )),
      child: IconButton(
          icon: Icon(
            iconName,
            color: Colors.white,
          ),
          onPressed: () {}),
    );
  }
}
