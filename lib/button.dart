// stateful widget CustomButton component

import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  // CustomButton with title string
  const CustomButton({
    Key? key,
    required this.title,
    required this.subtitleRow,
    required this.bodyRows,
    required this.backgroundColor,
    required this.fontColor,
    required this.footer,
    required this.rightSide,
    required this.onTap,
    this.minHeight = 125,
  }) : super(key: key);

  final String title;
  final List<String> subtitleRow;
  final List<String> bodyRows;
  final Color backgroundColor;
  final Color fontColor;
  final String footer;
  final List<Widget> rightSide;
  final Function onTap;
  final double minHeight;

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () => widget.onTap(),
        child: Container(
          constraints: BoxConstraints(
            minHeight: widget.minHeight,
            maxHeight: double.infinity,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: widget.backgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: widget.fontColor)),
                    const SizedBox(height: 7),
                    Wrap(
                      spacing: 10, // space between lines
                      children: widget.subtitleRow
                          .map(
                            (subtitle) => Text(
                              subtitle,
                              style: TextStyle(
                                fontSize: 14,
                                color: widget.fontColor,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    ...widget.bodyRows
                        .map(
                          (bodyRow) => Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              bodyRow,
                              style: TextStyle(
                                fontSize: 15,
                                color: widget.fontColor,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: widget.rightSide,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
