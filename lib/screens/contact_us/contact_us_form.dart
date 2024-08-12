import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helpfortrauma/core/constants/color_constants.dart';

class ContactUsForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding * 5, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,  // Ensures all children align to the end of the column
          children: [
            Text(
              'Contact us',
              style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 30),
            Text('Please reach out to us if you have questions about our enterprise',
              style: TextStyle(fontSize: 16, color: greyText)),
            Text('offerings, or anything else.',
              style: TextStyle(fontSize: 16, color: greyText)),
            SizedBox(height: 50),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ContactForm(),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: SupportSection(),
                ),
              ],
            ),
          ]
        )
      )
    );
  }
}

class ContactForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(16.0), // Adjust padding as necessary
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black54.withOpacity(0.3),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Name
            buildFormLabel('First Name *'),
            buildTextFormField('First Name', 'Please enter your first name', true),

            // Last Name
            buildFormLabel('Last Name *'),
            buildTextFormField('Last Name', 'Please enter your last name', true),

            // Email
            buildFormLabel('Email *'),
            buildTextFormField('Email', 'Please enter your email', true, isEmail: true),

            // Company Name
            buildFormLabel('Company Name'),
            buildTextFormField('Company Name', '', false),

            // Phone
            buildFormLabel('Phone'),
            buildTextFormField('Phone', '', false),

            // Message
            buildFormLabel('Message'),
            buildTextFormField('Message', 'Please enter a message', true, maxLines: 4),

            SizedBox(height: 24),
            // Full-width Send Button
            SizedBox(
              width: double.infinity, // Make button full-width
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle form submission
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Form submitted')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF7C4DFF), // Button color
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'Send',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  // Helper method to build a text label for form fields
  Widget buildFormLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0, bottom: 12.0),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }

  // Helper method to build a text form field
  Widget buildTextFormField(String label, String validationMessage, bool isRequired, {bool isEmail = false, int maxLines = 1}) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: primaryColor, // Focused border color
            width: 0.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.grey.shade400, // Normal border color
            width: 0.5,
          ),
        ),
        hintText: label.contains('Message') ? 'Write to us' : '',
        hintStyle: TextStyle(
          color: Colors.black45,
        ),
      ),
      validator: (value) {
        if (isRequired && (value == null || value.isEmpty)) {
          return validationMessage;
        }
        if (isEmail && value != null && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}

class SupportSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding as necessary
        child: buildSupportSection(),
      ),
    );
  }

  Widget buildSupportSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildHelpItem(
          icon: FontAwesomeIcons.headset,
          title: 'Technical support',
          description: 'Found a persistent bug, or need help setting a new team member up? Can’t crack a feature? ',
          actionText: 'Let us know!',
          actionLink: '#',
        ),
        SizedBox(height: 56),
        buildHelpItem(
          icon: FontAwesomeIcons.comments,
          title: 'General chat',
          description: 'Billing issues, customizations, plan changes--anything that doesn’t fit in the other two brackets, goes here.',
          actionText: 'Start Chat',
          actionLink: '#',
        ),
        SizedBox(height: 56),
        buildHelpItem(
          icon: FontAwesomeIcons.questionCircle,
          title: 'Help Center',
          description: 'Want to share feedback on an existing feature or suggest a new one? Talk to us!',
          actionText: 'Visit Help Center',
          actionLink: '#',
        ),
      ],
    );
  }

  Widget buildHelpItem({required IconData icon, required String title, required String description, required String actionText, required String actionLink}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Color(0xFFF3E5F5), // Background color of icon box
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Icon(
                  icon,
                  color: primaryColor, // Icon color
                  size: 24.0,
                ),
              ),
              SizedBox(height: 28),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 12),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  // Implement navigation or action here
                },
                child: Text(
                  actionText,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7C4DFF),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}