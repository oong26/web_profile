import 'package:flutter/material.dart';
import 'package:web_profile/constants/colors.dart';
import 'package:web_profile/constants/fontstyle.dart';

class TopBarContents extends StatefulWidget {
  ScrollController scrollController;
  List<double> items = [];

  TopBarContents(
      {Key? key, required this.scrollController, required this.items})
      : super(key: key);

  @override
  State<TopBarContents> createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  int _selectedMenu = 0;

  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
        color: mBlackColor,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              SizedBox(
                width: screenSize.width / 4,
              ),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[0] = true : _isHovering[0] = false;
                  });
                },
                onTap: () {
                  setState(() => _selectedMenu = 0);
                  widget.scrollController.animateTo(widget.items[0],
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'HOME',
                      style: _selectedMenu == 0
                          ? menuActiveTextStyle
                          : menuTextStyle,
                    ),
                    const SizedBox(height: 5),
                    Visibility(
                      maintainAnimation: true,
                      maintainState: true,
                      maintainSize: true,
                      visible: _isHovering[0],
                      child: Container(
                        height: 2,
                        width: 20,
                        color: mRedColor,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[1] = true : _isHovering[1] = false;
                  });
                },
                onTap: () {
                  setState(() => _selectedMenu = 1);
                  widget.scrollController.animateTo(widget.items[1],
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'ABOUT',
                      style: _selectedMenu == 1
                          ? menuActiveTextStyle
                          : menuTextStyle,
                    ),
                    const SizedBox(height: 5),
                    Visibility(
                      maintainAnimation: true,
                      maintainState: true,
                      maintainSize: true,
                      visible: _isHovering[1],
                      child: Container(
                        height: 2,
                        width: 20,
                        color: mRedColor,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[2] = true : _isHovering[2] = false;
                  });
                },
                onTap: () {
                  setState(() => _selectedMenu = 2);
                  widget.scrollController.animateTo(widget.items[2],
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'PORTFOLIO',
                      style: _selectedMenu == 2
                          ? menuActiveTextStyle
                          : menuTextStyle,
                    ),
                    const SizedBox(height: 5),
                    Visibility(
                      maintainAnimation: true,
                      maintainState: true,
                      maintainSize: true,
                      visible: _isHovering[2],
                      child: Container(
                        height: 2,
                        width: 20,
                        color: mRedColor,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[3] = true : _isHovering[3] = false;
                  });
                },
                onTap: () {
                  setState(() => _selectedMenu = 3);
                  widget.scrollController.animateTo(widget.items[3],
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'CONTACT',
                      style: _selectedMenu == 3
                          ? menuActiveTextStyle
                          : menuTextStyle,
                    ),
                    const SizedBox(height: 5),
                    Visibility(
                      maintainAnimation: true,
                      maintainState: true,
                      maintainSize: true,
                      visible: _isHovering[3],
                      child: Container(
                        height: 2,
                        width: 20,
                        color: mRedColor,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 80,
              ),
            ]),
          ),
        ));
  }
}
