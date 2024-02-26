import 'package:firebase_app/model/firebase_user.dart';
import 'package:firebase_app/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWidgetBuilder extends StatelessWidget {
  const AuthWidgetBuilder({
    super.key,
    required this.builder,
  });
  final Widget Function(
      BuildContext context, AsyncSnapshot<FirebaseUser?> snapShot) builder;
  @override
  Widget build(BuildContext context) {
    final service = Provider.of<AuthService>(context, listen: false);

    return StreamBuilder(
      stream: service.currentUser,
      builder: (context, snapshot) {
        final user = snapshot.data;
        if (user != null) {
          return MultiProvider(
            providers: [
              Provider.value(value: user),
            ],
            child: builder(context, snapshot),
          );
        }
        return builder(context, snapshot);
      },
    );
  }
}
