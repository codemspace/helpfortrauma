import 'package:flutter/material.dart';

class MainDropdownMenu extends StatefulWidget {
  final String title;
  final Map<String, String> items;

  const MainDropdownMenu({Key? key, required this.title, required this.items})
      : super(key: key);

  @override
  _MainDropdownMenuState createState() => _MainDropdownMenuState();
}

class _MainDropdownMenuState extends State<MainDropdownMenu> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool isHovering = false;

  void _showOverlay(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    // Calculate the width based on the longest item
    double width = size.width * 2;
    TextPainter painter = TextPainter(
      locale: Localizations.localeOf(context),
      textDirection: TextDirection.ltr,
    );
    widget.items.keys.forEach((item) {
      painter.text = TextSpan(text: item, style: TextStyle(fontSize: 16));
      painter.layout();
      if (painter.width > width) width = painter.width;
    });

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 5.0),
          child: Material(
            elevation: 4.0,
            color: Colors.white, // Ensure the background of the dropdown is white
            child: MouseRegion(
              onEnter: (_) => setState(() => isHovering = true),
              onExit: (_) {
                setState(() => isHovering = false);
                if (!isHovering) {
                  _hideOverlay();
                }
              },
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: widget.items.keys.map((String key) {
                  return Container(
                    color: Colors.white, // Ensure individual item background is white
                    child: ListTile(
                      title: Text(key),
                      onTap: () {
                        Navigator.of(context).pushNamed(widget.items[key]!);
                        _hideOverlay();
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context)!.insert(_overlayEntry!);
  }

  void _hideOverlay() {
    if (!isHovering) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: MouseRegion(
        onEnter: (_) {
          isHovering = true;
          _showOverlay(context);
        },
        onExit: (_) {
          isHovering = false;
          Future.delayed(Duration(milliseconds: 100), () {
            // Delay to allow for transition between button and dropdown
            if (!isHovering) _hideOverlay();
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(widget.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
