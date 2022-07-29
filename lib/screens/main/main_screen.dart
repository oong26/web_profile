import 'package:flutter/material.dart';
import 'package:web_profile/constants/colors.dart';
import 'package:web_profile/constants/fontstyle.dart';
import 'package:web_profile/widgets/top_bar_contents.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 70),
        child: const TopBarContents(),
      ),
      backgroundColor: mWhiteColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 715) {
              return desktopView(constraints);
            } else {
              return mobileView();
            }
          },
        ),
      ),
    );
  }

  Widget desktopView(BoxConstraints constraints) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400,
                child: Stack(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: mRedColor,
                      ),
                    ),
                    Positioned(
                      left: 35,
                      top: 40,
                      child: Text(
                        'LOREM',
                        style: bigTitleTextStyle,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Lorem Ipsum',
                style: subtitleTextStyle,
              ),
              const SizedBox(
                height: 80,
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: mBlackColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    )),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 58),
                  child: Text(
                    "Let's, Start",
                    style: bodyTextStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 24, top: 22),
                child: Text(
                  'Lorem Ipsum\ndolor sit amet',
                  style: subtitleTextStyle.copyWith(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 90,
              ),
              child: Image.asset('assets/images/kurt.png'),
            ),
          ),
        )
      ],
    );
  }

  Widget mobileView() {
    return Container(
      child: Text('mobile'),
    );
  }
}
