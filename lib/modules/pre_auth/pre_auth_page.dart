import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_go/core/ui/widgets/custom_button_widget.dart';
import 'package:movies_go/modules/pre_auth/google_signin_controller.dart';
import 'package:movies_go/router/router_navigation.dart';

class PreAuthPage extends GetView<GoogleSigninController> {
  const PreAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/pre_auth_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              const Color(0xFF050505).withOpacity(0.75),
              BlendMode.srcOver,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo5.png',
                width: 300,
                height: 80,
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Column(
                  children: [
                    CustomButtom(
                      backgroundColor: const Color(0xFF5FCFED),
                      child: const Text(
                        'Registrar-se',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed(
                          AppRouter.sigup,
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomButtom(
                      backgroundColor: const Color(0xFF5FCFED),
                      child: const Text(
                        'Entrar',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed(
                          AppRouter.signin,
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Expanded(
                          child: Divider(
                            indent: 20.0,
                            endIndent: 10.0,
                            thickness: 1,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "OU",
                          style: TextStyle(color: Colors.white),
                        ),
                        Expanded(
                          child: Divider(
                            indent: 10.0,
                            endIndent: 20.0,
                            thickness: 1,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    //const GoogleSigninPage()

                    InkWell(
                      onTap: () {
                        controller.signinwithgoogle();
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(50),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20, 15.0, 20.0, 15.0),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              alignment: WrapAlignment.spaceAround,
                              children: [
                                Image.asset('assets/images/google_button.png',
                                    height: 25.0),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  'Entrar com Google',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /*
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  */
}
