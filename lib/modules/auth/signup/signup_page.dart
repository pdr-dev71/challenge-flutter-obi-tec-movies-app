import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_go/core/ui/widgets/custom_app_bar.dart';
import 'package:movies_go/core/ui/widgets/custom_button_widget.dart';
import 'package:movies_go/core/ui/widgets/custom_text_form_field_widget.dart';
import 'package:movies_go/modules/auth/signin/signin_controller.dart';
import 'package:movies_go/modules/auth/signup/signup_controller.dart';
import 'package:validatorless/validatorless.dart';

class SignupPage extends GetView<SigninController> {
  SignupPage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF05133A),
      appBar: const CustomAppBar(
        title: Text(
          'Criar conta',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/signup.png',
                  height: 250,
                  width: 300,
                ),
                CustomTextFormFieldWidget(
                    hintText: 'Seu nome',
                    fillcolor: const Color(0xFF2C3759),
                    filed: true,
                    labelText: 'Nome',
                    controller: _nameController,
                    validator: Validatorless.required('Nome obrigatório')),
                const SizedBox(height: 10),
                CustomTextFormFieldWidget(
                  hintText: 'Seu email',
                  fillcolor: const Color(0xFF2C3759),
                  filed: true,
                  labelText: 'Email',
                  controller: _emailController,
                  validator: Validatorless.multiple([
                    Validatorless.required('Email obrigatório'),
                    Validatorless.email('Email inválido'),
                  ]),
                ),
                const SizedBox(height: 10),
                CustomTextFormFieldWidget(
                  hintText: 'Sua senha',
                  fillcolor: const Color(0xFF2C3759),
                  filed: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
                  labelText: 'Senha',
                  controller: _passwordController,
                  validator: Validatorless.multiple([
                    Validatorless.required('Senha obrigatória'),
                    Validatorless.min(
                        8, 'Senha deve ter no mínimo 8 caracteres'),
                  ]),
                ),
                const SizedBox(height: 10),
                CustomButtom(
                  backgroundColor: const Color(0xFF5FCFED),
                  child: SigninController().loading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Criar conta",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      SignupController().signup(
                        _nameController.text,
                        _emailController.text,
                        _passwordController.text,
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
