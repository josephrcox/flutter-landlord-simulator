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
    this.leadingIcon,
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
  final String? leadingIcon;

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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        if (widget.leadingIcon != null)
                          Text(widget.leadingIcon as String,
                              style: TextStyle(fontSize: 72)),
                        const SizedBox(width: 16),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                fontSize: 28,
                                color: widget.fontColor,
                              ),
                            ),
                            Wrap(
                              spacing: 8,
                              children: widget.subtitleRow
                                  .map(
                                    (subtitle) => Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Text(
                                        subtitle,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(
                                              255, 192, 191, 191),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                            ...widget.bodyRows
                                .map(
                                  (bodyRow) => Padding(
                                    padding: const EdgeInsets.only(top: 4),
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
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              widget.footer,
                              style: TextStyle(
                                fontSize: 16,
                                color: widget.fontColor,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: widget.rightSide,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
