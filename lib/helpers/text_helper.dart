import 'package:flutter/material.dart';

String splitTextIntoLines(String text, int maxCharsPerLine) {
  List<String> lines = [];
  List<String> words = text.split(' ');
  
  String currentLine = '';

  for (var word in words) {
    if ((currentLine + (currentLine.isEmpty ? '' : ' ') + word).length <= maxCharsPerLine) {
      currentLine += (currentLine.isEmpty ? '' : ' ') + word;
    } else {
      lines.add(currentLine);
      currentLine = word;
    }
  }

  if (currentLine.isNotEmpty) {
    lines.add(currentLine);
  }

  return lines.join('\n');
}

class BulletText extends StatelessWidget {
  final Widget textWidget;

  BulletText(this.textWidget);

  @override
  Widget build(BuildContext context) {
    Color? textColor;

    if (textWidget is Text) {
      final text = textWidget as Text;
      textColor = text.style?.color;
    }

    return Row(
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: textColor ?? Colors.green,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 10),
        textWidget,
      ],
    );
  }
}





