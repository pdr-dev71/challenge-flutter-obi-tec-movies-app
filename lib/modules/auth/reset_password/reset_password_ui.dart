import 'package:flutter/material.dart';
import 'package:movies_go/core/ui/widgets/custom_text_form_field_widget.dart';

class ResetPasswordUi extends StatelessWidget {
  const ResetPasswordUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperação de senha'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          CustomTextFormFieldWidget(
            filed: true,
            labelText: 'Email',
            controller: emailController,
          )
        ],
      )),
    );
  }
}
