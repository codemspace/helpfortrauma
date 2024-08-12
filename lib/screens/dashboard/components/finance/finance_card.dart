import 'package:flutter/material.dart';
import 'package:helpfortrauma/core/constants/color_constants.dart';

class FinanceCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final String image;
  final IconData icon;
  final Function() onTap;

  const FinanceCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.image,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  _FinanceCardState createState() => _FinanceCardState();
}

class _FinanceCardState extends State<FinanceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _setHover(true),
      onExit: (event) => _setHover(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: isHovered ? Colors.deepPurple : secondaryColor,
            borderRadius: BorderRadius.circular(12),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.5),
            //     blurRadius: 10,
            //     offset: Offset(0, 4),
            //   ),
            // ],
          ),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(widget.image),
                    ),
                    Positioned(
                      bottom: -10,
                      right: -30,
                      child: RawMaterialButton(
                        onPressed: () {},
                        elevation: 2.0,
                        fillColor: Color(0xFFF5F6F9),
                        child: Icon(widget.icon, color: Colors.deepPurple,),
                        padding: EdgeInsets.all(8.0),
                        shape: CircleBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isHovered ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.subtitle,
                // textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: isHovered ? Colors.white : Colors.grey[600],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: widget.onTap,
                style: ElevatedButton.styleFrom(
                  foregroundColor: isHovered ? Colors.purple[300] : Colors.deepPurple, // Adjust button color based on hover state
                  backgroundColor: Colors.white, // Text color
                ),
                child: Text(widget.buttonText),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _setHover(bool hover) {
    setState(() {
      isHovered = hover;
    });
  }
}
