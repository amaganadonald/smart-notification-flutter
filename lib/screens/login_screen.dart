import 'package:flutter/material.dart';
import 'package:flutter_application_1/animations/fade_animation.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:flutter_application_1/utils/global.colors.dart';
import 'package:flutter_application_1/widgets/button_widget.dart';
import 'package:flutter_application_1/widgets/text_field_widget.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

    @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;

  Future<void> _handleLogin() async {
    setState(() => isLoading = true);

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final response = await AuthService().login(email, password);

    setState(() => isLoading = false);

    if (!mounted) return;

    if (response.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed')),
      );
    } else {
      Navigator.pushReplacementNamed(context, '/home', arguments: { 'data_login': response});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [GlobalColors.mainColor, GlobalColors.secondaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      FadeAnimation(
                        1,
                        Text(
                          "Login",
                          style: TextStyle(
                            color: GlobalColors.textColor,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      FadeAnimation(
                        1.3,
                        Text(
                          "Sign in to continue",
                          style: TextStyle(
                            color: GlobalColors.SubTextColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: GlobalColors.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 40),
                        _buildInputFields(),
                        const SizedBox(height: 30),
                        isLoading
                            ? Center(child: CircularProgressIndicator())
                            : const SizedBox.shrink(),
                         Center(
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(color: GlobalColors.textGrey),
                          ),
                        ),
                        const SizedBox(height: 30),
                        ButtonWidget(
                          text: "Login",
                          onPressed: _handleLogin,
                        ),
                        const SizedBox(height: 20),
                         Center(
                          child: Text(
                            "Create New Account",
                            style: TextStyle(color: GlobalColors.textDark),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputFields() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(255, 95, 27, 0.3),
            blurRadius: 20,
            offset: Offset(0, 10),
          )
        ],
      ),
      child: Column(
        children: [
          TextFieldWidget(
            value: "Email",
            controller: _emailController,
            isPassword: false,
            label: "Email or Phone",
            icon: const Icon(Icons.mail),
          ),
          const Divider(color: Colors.grey, height: 1),
          TextFieldWidget(
            value: "Password",
            isPassword: true,
            controller: _passwordController,
            label: "Password",
            icon: const Icon(Icons.lock),
          ),
        ],
      ),
    );
  }

}