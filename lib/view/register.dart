import 'package:app/helper/Auth.dart';
import 'package:app/view/login.dart';
import 'package:app/widgets/custom_RowAuth_Text.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:app/widgets/custom_textfield.dart';
import 'package:app/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:app/helper/database.dart';
import 'package:app/view/home.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final UserModel _userModel = UserModel();
  final UserDatabase _userDatabase = UserDatabase();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController FullName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Create Account ',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Please fill the input below here ',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            CustomTextField(
              controller: FullName,
              keyboardType: TextInputType.text,
              hintText: 'full name',
              labelText: 'FULL NAME',
              prefixIcon: const Icon(Icons.person),
            ),
            CustomTextField(
              keyboardType: TextInputType.number,
              hintText: 'phone',
              labelText: 'PHONE',
              prefixIcon: const Icon(Icons.phone_android),
            ),
            CustomTextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              hintText: 'Email',
              labelText: 'EMAIL',
              prefixIcon: const Icon(Icons.email),
            ),
            CustomTextField(
                controller: password,
                hintText: 'Password',
                labelText: 'PASSWORD',
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                suffixIcon: const IconButton(
                    onPressed: null, icon: Icon(Icons.remove_red_eye))),
            const SizedBox(
              height: 15,
            ),
            customButton(
              onTap: () async {
                try {
                  await _userModel.registerUser(email.text, password.text);
                  SnackbarUtil.showSnackbar(
                    context,
                    'You Login Successfully',
                    () {},
                  );

  print('Adding user...');
    await _userDatabase.addUser(FullName.text);
    print('User added successfully');
                  // ignore: use_build_context_synchronously
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomeView();
                  }));
                } catch (e) {
                  // ignore: use_build_context_synchronously
                  SnackbarUtil.showSnackbar(
                    context,
                    e.toString(),
                    () {},
                  );
                }
              },
              text: 'SIGN UP',
            ),
            const SizedBox(
              height: 15,
            ),
            RowAuthText(
              textStatus: 'Already have an account ?',
              ButtonStatus: 'Sign In',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginView();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
