import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _obscure = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    final email = _emailCtrl.text.trim();
    final password = _passwordCtrl.text;
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter email and password')));
      return;
    }

    setState(() => _isLoading = true);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Signed in successfully')));
      // TODO: navigate to app's main area on success
    } on FirebaseAuthException catch (e) {
      final msg = e.message ?? 'Authentication failed';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('An error occurred')));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final bg = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo
                Column(
                  children: [
                    // placeholder logo circle
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8)],
                      ),
                      child: Center(
                        child: Icon(Icons.home_outlined, size: 36, color: primary),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text('HabiSpace', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: primary)),
                    const SizedBox(height: 18),
                    const Text('Sign In Account', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 18),
                  ],
                ),

                // Email
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Email', style: TextStyle(fontSize: 13, color: Colors.grey[700])),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 12),

                // Password
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Password', style: TextStyle(fontSize: 13, color: Colors.grey[700])),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: _passwordCtrl,
                  obscureText: _obscure,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                    suffixIcon: IconButton(
                      icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Forgot password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // TODO: handle forgot password
                    },
                    style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: const Size(50, 30)),
                    child: const Text('Forgot Password?', style: TextStyle(color: Colors.blueAccent)),
                  ),
                ),

                const SizedBox(height: 6),
                // Login button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _signIn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: _isLoading
                        ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                        : const Text('Login', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                  ),
                ),

                const SizedBox(height: 12),
                // OR divider
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                    const SizedBox(width: 10),
                    Text('or login with', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                    const SizedBox(width: 10),
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                  ],
                ),
                const SizedBox(height: 12),

                // Social buttons
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: Container(
                          width: 22,
                          height: 22,
                          alignment: Alignment.center,
                          child: const Text('G', style: TextStyle(fontWeight: FontWeight.w700, color: Colors.red)),
                        ),
                        label: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text('Continue with Google', style: TextStyle(color: Colors.black87)),
                        ),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.grey.shade300),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.apple, color: Colors.white),
                        label: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text('Continue with Apple', style: TextStyle(color: Colors.white)),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),
                // Sign up link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        // TODO: navigate to sign up
                      },
                      child: Text('Sign up', style: TextStyle(color: primary, fontWeight: FontWeight.w600)),
                    )
                  ],
                ),

                const SizedBox(height: 12),
                // Terms and conditions
                Text.rich(
                  TextSpan(
                    text: 'By signing in you agree to our ',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    children: [
                      TextSpan(text: 'Terms and Conditions', style: TextStyle(color: primary), recognizer: TapGestureRecognizer()..onTap = () {}),
                      const TextSpan(text: '. Learn how we use your data in our '),
                      TextSpan(text: 'Privacy Policy', style: TextStyle(color: primary), recognizer: TapGestureRecognizer()..onTap = () {}),
                      const TextSpan(text: '.'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
