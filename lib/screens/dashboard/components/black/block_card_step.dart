import 'package:flutter/material.dart';
import 'package:helpfortrauma/core/constants/color_constants.dart';

class BlockCardStepsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding * 5, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "How to get a Block Card in a ",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            "simple 3 steps",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: lightPurple,
            ),
          ),
          SizedBox(height: 24),
          Text(
            "Designed to work better together erat velit eget hac nulla nullam et id",
            style: TextStyle(
              fontSize: 14,
              color: greyText,
            ),
          ),
          Text(
            "praesent nisi ornare risus risus consequat nunc nisl pellentesque",
            style: TextStyle(
              fontSize: 14,
              color: greyText,
            ),
          ),
          Text(
            "diam neque.",
            style: TextStyle(
              fontSize: 14,
              color: greyText,
            ),
          ),
          SizedBox(height: 20),
          buildSteps(),
          SizedBox(height: 20),
          Center(child: 
            HoverButton()
          )
        ],
      ),
    );
  }
}

Widget buildSteps() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      buildStep(1, "Sign up for a free account", "Apply online on block website and fill the form by telling us your name, address, date of birth."),
      buildArrow(),
      buildStep(2, "Fill in your details", "Get started on block or log into the mobile app. Bank account to transfer money to your debit card."),
      buildArrow(),
      buildStep(3, "Start converting!", "Set up direct deposit or connect your current bank account to transfer money to your debit card."),
    ],
  );
}

Widget buildStep(int number, String title, String description) {
  return Expanded(
    child: Container(
      padding: EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NumberBadge(
            number: number,
            size: 50.0, // You can adjust the size as needed
          ),
          SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            // textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
            // textAlign: TextAlign.center,
          ),
        ],
      ),
    )
  );
}

Widget buildArrow() {
  return Icon(
    Icons.arrow_right_alt,
    color: Colors.grey,
    size: 30,
  );
}

class NumberBadge extends StatelessWidget {
  final int number;
  final double size;
  final Color borderColor;
  final double borderWidth;

  const NumberBadge({
    Key? key,
    required this.number,
    this.size = 24.0, // default size
    this.borderColor = whitePurple, // default border color
    this.borderWidth = 4.0, // default border width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size + borderWidth * 2, // adjust the total size to include the border
      height: size + borderWidth * 2,
      decoration: BoxDecoration(
        color: borderColor, // outer circle color, acting as border
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: lightPurple,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          number.toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: size * 0.5, // adjust the font size based on the size of the badge
          ),
        ),
      ),
    );
  }
}

class HoverButton extends StatefulWidget {
  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _updateHover(true),
      onExit: (event) => _updateHover(false),
      child: OutlinedButton(
        onPressed: () {
          print('Button Pressed!');
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: _isHovering ? lightPurple : Colors.white,
          side: BorderSide(color: _isHovering ? Colors.white : lightPurple, width: 1.0),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        child: Text(
          'Open an Account',
          style: TextStyle(fontSize: 16, color: _isHovering ? Colors.white : lightPurple),
        ),
      ),
    );
  }

  void _updateHover(bool isHovering) {
    setState(() {
      _isHovering = isHovering;
    });
  }
}