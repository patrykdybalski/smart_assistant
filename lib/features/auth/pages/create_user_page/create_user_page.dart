import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/features/auth/pages/create_user_page/widgets/create_account_button.dart';
import 'package:primary_school/features/auth/pages/create_user_page/widgets/textfield_create_email.dart';
import 'package:primary_school/features/auth/pages/create_user_page/widgets/textfield_create_password.dart';

class CreateUserPage extends StatelessWidget {
  const CreateUserPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const _CreatePagebody(),
    );
  }
}

class _CreatePagebody extends StatefulWidget {
  const _CreatePagebody();

  @override
  State<_CreatePagebody> createState() => _CreatePagebodyState();
}

String? email;
String? password;

class _CreatePagebodyState extends State<_CreatePagebody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          const SizedBox(height: 80),
          const LogoImageContainer(),
          Card(
            color: Theme.of(context).colorScheme.primary.withOpacity(1),
            elevation: 0.5,
            surfaceTintColor: Colors.transparent,
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4.0,
                ),
                child: Column(
                  children: [
                    TextFieldCreateEmail(onEmailChanged: (newValue) {
                      setState(() {
                        email = newValue;
                      });
                    }),
                    TextFieldCreatePassword(
                      onPasswordChanged: (newValue) {
                        setState(() {
                          password = newValue;
                        });
                      },
                    ),
                    const SizedBox(height: 38),
                    CreateAccountButton(
                      email: email,
                      password: password,
                    ),
                    const SizedBox(height: 8),
                    const BackToLoginPageButton(),
                    const SizedBox(height: 10),
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}

class BackToLoginPageButton extends StatelessWidget {
  const BackToLoginPageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.secondary,
      ),
      child: Text('Mam już konto',
          style: TextStyles.textStyle1(
            17,
            Theme.of(context).colorScheme.inversePrimary,
          )),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}

class LogoImageContainer extends StatelessWidget {
  const LogoImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(
          image: AssetImage('assets/images/logo@1.png'),
          height: 100,
        ),
        const SizedBox(height: 6),
        Text(
          'HOOKIT.',
          style: TextStyles.appBarStyle1(
            34,
            Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        const SizedBox(height: 32),
        Column(
          children: [
            Icon(
              Icons.group_add_rounded,
              color: Theme.of(context).colorScheme.inversePrimary,
              size: 40,
            ),
            const SizedBox(height: 6),
            Text(
              'Uwtórz konto!',
              style: TextStyles.textStyle2(
                22,
                Theme.of(context).colorScheme.tertiary,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        const SizedBox(height: 6),
      ],
    );
  }
}
