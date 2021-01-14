import 'package:flutter/material.dart';
import '../model/model_user.dart';
import '../utils/db_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();

  DatabaseHelper db = DatabaseHelper();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void check() {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      isLoading = true;
      setState(() {});
      submitDataRegister();
    }
  }

  void submitDataRegister() async {
    var result = await db.saveUser(
      Modeluser.fromMap({
        'username': _usernameController.text,
        'password': _passwordController.text,
        'email': _emailController.text,
      }),
    );

    print(result);
    if (result != null) {
      Fluttertoast.showToast(
          msg: "Register success !",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 24);
      _emailController.clear();
      _usernameController.clear();
      _passwordController.clear();
      _rePasswordController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/logo_itsva.png",
                      fit: BoxFit.fill,
                      scale: 1.5,
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              controller: _usernameController,
                              validator: (e) {
                                return e.toLowerCase().trim().isEmpty
                                    ? 'por favor inserte un nombre de usuario'
                                    : null;
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                prefixIcon: Icon(
                                  Icons.person,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: _emailController,
                              validator: (e) {
                                return e.toLowerCase().trim().isEmpty
                                    ? 'por favor inserte su correo institucional'
                                    : null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(
                                  Icons.email,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: _passwordController,
                              validator: (e) {
                                return e.toLowerCase().trim().isEmpty
                                    ? 'por favor inserte una contraseña'
                                    : null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(
                                  Icons.lock,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: _rePasswordController,
                              validator: (e) {
                                if (e.toLowerCase().trim().isEmpty)
                                  return 'por favor confirma su contraseña';
                                if (_rePasswordController.text
                                        .toLowerCase()
                                        .trim() !=
                                    _passwordController.text
                                        .toLowerCase()
                                        .trim()) {
                                  return 'la contraseña tiene que ser igual que la anterior';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                prefixIcon: Icon(
                                  Icons.lock,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            RaisedButton(
                              onPressed: check,
                              child: Text('Guardar'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have account ? ",
                        style: TextStyle(
                          letterSpacing: 2,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            letterSpacing: 2,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
