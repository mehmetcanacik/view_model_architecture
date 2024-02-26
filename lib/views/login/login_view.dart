import 'package:firebase_app/base_view_model/base_view_model.dart';
import 'package:firebase_app/views/login/login_view_model.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseViewModel<LoginViewModel>(
      onViewModelReady: (viewModel) {
        viewModel.setContext(context);
        viewModel.init();
      },
      onDispose: (viewModel) {
        
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Login"),
          ),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: viewModel.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "user@domain.com",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                context.heightGap(10),
                TextField(
                  controller: viewModel.passwordController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                context.heightGap(20),
                TextButton(
                  onPressed: () async {
                    await viewModel.register();
                  },
                  child: const Text("Register"),
                )
              ].getList(5),
            ),
          ),
        );
      },
    );
  }
}

extension SizeX on BuildContext {
  Widget widthGap(double value) => SizedBox(width: value);
  Widget heightGap(double value) => SizedBox(height: value);
}

extension ListX on List {
  List<Widget> getList(double value) => map(
        (item) => Padding(
          padding: EdgeInsets.all(value),
          child: item,
        ),
      ).toList();
}
