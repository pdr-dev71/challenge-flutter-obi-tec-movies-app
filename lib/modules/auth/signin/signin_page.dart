import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_go/core/ui/widgets/custom_app_bar.dart';
import 'package:movies_go/core/ui/widgets/custom_button_widget.dart';
import 'package:movies_go/core/ui/widgets/custom_text_form_field_widget.dart';
import 'package:movies_go/modules/auth/signin/signin_controller.dart';

class SigninPage extends GetView<SigninController> {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFF05133A),
      appBar: const CustomAppBar(
          title: Text(
        'Entrar',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
      )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/signin.png',
                  height: 250,
                  width: 300,
                ),
                CustomTextFormFieldWidget(
                  hintText: 'Seu email',
                  fillcolor: const Color(0xFF2C3759),
                  filed: true,
                  labelText: 'Email',
                  controller: emailController,
                ),
                const SizedBox(height: 10),
                CustomTextFormFieldWidget(
                  hintText: 'Sua senha',
                  fillcolor: const Color(0xFF2C3759),
                  filed: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
                  labelText: 'Senha',
                  controller: passwordController,
                ),
                const SizedBox(height: 20),
                CustomButtom(
                  backgroundColor: const Color(0xFF5FCFED),
                  child: SigninController().loading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Entrar",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      SigninController().signin(
                        emailController.text,
                        passwordController.text,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
