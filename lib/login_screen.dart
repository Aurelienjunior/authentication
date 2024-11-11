import 'package:authentication/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Dismiss the keyboard
        },
        child:
            const Scaffold(body: SingleChildScrollView(child: LoginContent())));
  }
}

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      // padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      width: screenWidth * 1,
      height: screenHeight * 1,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              // color: Colors.red,
              'assets/img/login.png',
              width: screenWidth * 1,
            ),
          ),
          Container(
            // color: Colors.amber,
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            width: screenWidth * 1,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const CustomTextFormField(
                labelText: 'Username',
                prefixIcon: Icons.person_2_outlined,
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextFormField(
                labelText: 'Password',
                prefixIcon: Icons.lock_outline,
                suffixIcon: Icons.visibility_off_outlined,
                isVisible: true,
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ]),
          ),

          // This snippet of code containes the Login Button and SignUp Button plus the Facebook and Google SignUp's
          // Here is the Login Button
          Container(
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            // color: Colors.red[50],
            width: screenWidth * 1,
            child: Column(
              children: [
                SizedBox(
                  height: 55,
                  width: screenWidth * 1,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 21),
                    ),
                  ),
                ),

                // Here is the SignUp Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an Account ?',
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: const Text('SignUp'))
                  ],
                ),

                //Here is the Or Row with two divider
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Or',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                // Here are the other options for SignUp or login with facebook and google
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.blue, width: 2)),
                      width: 145,
                      height: 45,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            color: Colors.white,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.facebook_outlined,
                              color: Colors.blue,
                            ),
                          ),
                          const Text('Facebook')
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.red, width: 2)),
                      width: 145,
                      height: 45,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.google),
                            color: Colors.red,
                          ),
                          const Text('Google')
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isVisible;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.isVisible = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isVisible && !isVisible,
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        // suffixIcon: widget.suffixIcon != null ? Icon(widget.suffixIcon,) : null,
        suffixIcon: widget.isVisible
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon: Icon(
                  isVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ))
            : (widget.suffixIcon != null ? Icon(widget.suffixIcon) : null),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
