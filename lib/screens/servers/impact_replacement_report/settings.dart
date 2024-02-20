import 'dart:math';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:flutter/material.dart';

class ImpactReplacementReportSettings extends StatefulWidget {
  @override
  State<ImpactReplacementReportSettings> createState() =>
      _ImpactReplacementReportSettingsState();
}

class _ImpactReplacementReportSettingsState extends State<ImpactReplacementReportSettings> {
  final List<String> dropdownItems =
  List.generate(9, (index) => (index + 1).toString());
  String? selectedDropdownValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildYearSelectorBar(),
        SizedBox(height: 30),
        _buildSection('Current product', '22 pieces of server x', [
          _buildTextRow(['lifetime product so far', '3 years']),
          _buildDropdownRow(),
        ]),
        SizedBox(height: 30),
        _buildSection('Replacement product', '10 pieces of server y', []),
        SizedBox(height: 30),
        _buildSection('Scenarios', '', [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRow(Colors.purpleAccent,
                    'total emissions of current products'),
                _buildRow(Colors.blue,
                    'total emissions of replacement products'),
                _buildRow(
                  Colors.green,
                  'total reduction of emissions by extending lifetime of current products, compared to replacement scenario',
                ),
                _buildRow(Colors.black, 'break even point'),
              ],
            ),
          ),
        ]),
      ],
    );
  }

  Widget _buildSection(
      String title, String subtitle, List<Widget> additionalWidgets) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(subtitle),
        ...additionalWidgets,
      ],
    );
  }

  Widget _buildDropdownRow() {
    return Row(
      children: [
        Text('current server will be placed in'),
        SizedBox(width: 20),
        DropdownButton<String>(
          value: dropdownItems.first,
          items: dropdownItems
              .map((String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ))
              .toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedDropdownValue = newValue;
            });
          },
        ),
        Text('3 years'),
      ],
    );
  }

  Widget _buildTextRow(List<String> texts) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: texts
          .map(
            (text) => Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(text),
            ),
          )
          .toList(),
    );
  }

  Widget _buildRow(Color color, String text) {
    return Row(
      children: [
        _buildLine(color: color),
        SizedBox(width: 10),
        Text(text),
      ],
    );
  }

  Widget _buildLine({required Color color}) {
    return Container(
      height: 2.0,
      width: 30.0,
      color: color,
    );
  }

FlutterSlider _buildYearSelectorBar() {
  return FlutterSlider(
    values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    min: 1,
    max: 10,
    trackBar: FlutterSliderTrackBar(
      inactiveTrackBar: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 2, color: Colors.blue),
      ),
      activeTrackBar: BoxDecoration(
        color: Colors.blue.withOpacity(0.5),
        borderRadius: BorderRadius.circular(4),
      ),
      activeTrackBarHeight: 30, // Adjust the thickness as needed
      inactiveTrackBarHeight: 30, // Adjust the thickness as needed
    ),
    handler: FlutterSliderHandler(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    tooltip: FlutterSliderTooltip(
      alwaysShowTooltip: true,
      textStyle: TextStyle(fontSize: 18),
      positionOffset: FlutterSliderTooltipPositionOffset(top: -40),
    ),
  );
}

}


class CustomSliderThumbShape extends SliderComponentShape {
  final double thumbHeight;
  final double thumbRadius;

  CustomSliderThumbShape({
    required this.thumbHeight,
    required this.thumbRadius,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = sliderTheme.thumbColor!
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0;

    final double angle = value / 10 * 3 * pi / 2;

    final double thumbX = center.dx + thumbRadius * cos(angle);
    final double thumbY = center.dy + thumbRadius * sin(angle);

    final Path path = Path()
      ..moveTo(thumbX - thumbHeight / 2, thumbY - thumbRadius)
      ..lineTo(thumbX + thumbHeight / 2, thumbY - thumbRadius)
      ..lineTo(thumbX, thumbY + thumbRadius)
      ..close();

    canvas.drawPath(path, paint);
  }
}