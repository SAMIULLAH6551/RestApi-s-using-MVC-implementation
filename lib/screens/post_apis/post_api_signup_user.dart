import 'package:all_rest_apis/controllers/post_api_controller.dart';
import 'package:flutter/material.dart';

class PostApiSignup extends StatelessWidget {
  PostApiSignup({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final PostController postController = PostController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Api Signup User"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Signup Form"),
              const SizedBox(
                height: 20,
              ),
              TextFieldResusable(controller: emailController, label: "Email"),
              TextFieldResusable(
                  controller: passwordController, label: "Password"),
              ElevatedButton(
                onPressed: () {
                  postController.registerUser(
                      emailController.text, passwordController.text);
                  emailController.clear();
                  passwordController.clear();
                },
                child: const Text("Register"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  postController.loginUser(
                      emailController.text, passwordController.text);
                  emailController.clear();
                  passwordController.clear();
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldResusable extends StatelessWidget {
  TextFieldResusable({Key? key, required this.controller, required this.label})
      : super(key: key);

  TextEditingController controller;
  String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            label: Text(label),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
