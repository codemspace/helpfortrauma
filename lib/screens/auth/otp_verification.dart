import 'package:flutter/material.dart';
import 'package:helpfortrauma/models/user.dart';

class OTPVerificationScreen extends StatefulWidget {
  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _codeControllers =
      List.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    for (var controller in _codeControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  String _getEnteredOTP() {
    return _codeControllers.map((controller) => controller.text).join();
  }

  void _submit(String email) {
    if (_formKey.currentState?.validate() ?? false) {
      final otp = _getEnteredOTP();
      if (User.verifyOtp(email, otp)) {
        Navigator.pushNamed(context, '/reset-password');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid OTP. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _buildCodeField(int index) {
    return SizedBox(
      width: 70,  // Increased width for larger input boxes
      height: 70, // Added height for larger input boxes
      child: TextFormField(
        controller: _codeControllers[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: TextStyle(
          fontSize: 24, // Increased font size for better visibility
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0), // Slightly rounded corners
            borderSide: BorderSide(
              color: Colors.deepPurple.withOpacity(0.5),
              width: 2.0, // Increased border width for prominence
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Colors.deepPurple,
              width: 2.5, // More pronounced focus border
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '';
          }
          return null;
        },
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(children: [
          Expanded(
            child: _buildForm(),
            flex: 2, // Adjust flex to control width of the form relative to the image
          ),
          Expanded(
            child: _buildBackgroundImage(),
            flex: 3, // Adjust flex to control width of the image
          ),
        ]),
      ),
    );
  }

  Widget _buildForm() {
    final email = ModalRoute.of(context)?.settings.arguments as String;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.lock,
                size: 80.0,
                color: Colors.deepPurple,
              ),
              SizedBox(height: 20.0),
              Text(
                'Password Reset',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
              Text(
                'We sent a code to $email',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ]
          ),
          SizedBox(height: 8.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return _buildCodeField(index);
                  }),
                ),
              ),
              SizedBox(height: 30.0),
              GestureDetector(
                onTap: () => _submit(email),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.3),
                        offset: Offset(0, 4),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      // Implement resend code logic here
                    },
                    child: Text(
                      'Didn\'t receive the email? Click send it again.',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signin');
                    },
                    child: Text(
                      '← Back to Login',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
      ])
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/sign-in/authentication-img.jpg"), // Replace with your image asset path
          fit: BoxFit.cover, // This will cover the whole expanded area
        ),
      ),
    );
  }

}


