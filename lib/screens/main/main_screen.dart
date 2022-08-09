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
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderSection(),
          BiographSection(constraints: constraints),
        ],
      ),
    );
  }

  Widget mobileView() {
    return Container(
      child: Text('mobile'),
    );
  }
}

class BiographSection extends StatelessWidget {
  final BoxConstraints constraints;

  const BiographSection({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final bio =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam malesuada, eros ac feugiat feugiat, massa ligula eleifend neque, at pellentesque est urna consectetur lacus. Donec luctus ipsum tellus, ac laoreet massa imperdiet quis. Integer varius neque ut felis finibus volutpat. Nunc accumsan, sem sit amet ullamcorper malesuada, ligula ipsum ornare velit, eget tincidunt orci ipsum ut massa. Nunc ut varius mi, in auctor tellus. Praesent hendrerit purus ac nibh viverra, eu congue purus pretium. Nulla sit amet nulla efficitur est convallis facilisis commodo eu metus. In hac habitasse platea dictumst. Integer hendrerit convallis vulputate. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Maecenas commodo leo metus, non dapibus diam elementum vel. Aliquam vitae tincidunt enim.\n\nCras vitae rutrum magna, sit amet volutpat velit. Suspendisse potenti. Quisque malesuada ornare lacus vitae tempus. Suspendisse blandit turpis vitae tincidunt dapibus. Mauris sed nisi dui. Mauris et nulla eleifend, varius quam sed, ullamcorper nisl. Vestibulum ornare laoreet tortor ac posuere. Nulla commodo fringilla mi, et sagittis lacus ultricies eget. Fusce lacinia congue odio nec vehicula. Nunc vehicula fringilla tellus.\n\nDonec pretium tristique vulputate. Nullam sed vestibulum est, vitae consequat elit. Integer non nisi ut magna blandit vulputate quis ut arcu. Proin a quam id orci gravida commodo eget suscipit mauris. Duis scelerisque eros ac congue iaculis. Sed sollicitudin vitae nisi quis faucibus. Vestibulum blandit, lectus quis elementum congue, ligula velit placerat magna, eu volutpat augue sapien in felis. In hac habitasse platea dictumst.';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mBlackColor,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 90,
              ),
              child: Image.asset(
                'assets/images/kurt2.png',
                width: 580,
                height: 684,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(left: 60, right: 150),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Lorem Ip',
                    style: titleTextStyle,
                  ),
                  SizedBox(
                      height: 80,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/smile.png',
                            width: 75,
                            height: 71,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Dolor Sit',
                            style: titleTextStyle,
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    bio,
                    style: bodyTextStyle,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/down-arrow.png',
                      width: 34,
                      height: 34,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: Padding(
            padding: const EdgeInsets.only(
              top: 90,
            ),
            child: Image.asset(
              'assets/images/kurt.png',
              width: 580,
              height: 684,
            ),
          ),
        )
      ],
    );
  }
}
