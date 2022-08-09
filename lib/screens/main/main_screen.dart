import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_profile/constants/colors.dart';
import 'package:web_profile/constants/fontstyle.dart';
import 'package:web_profile/widgets/get_box_offset.dart';
import 'package:web_profile/widgets/portfolio_card.dart';
import 'package:web_profile/widgets/top_bar_contents.dart';

import 'cubit/select_menu_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<double> items = [];

  ScrollController scrollController = ScrollController();

  List<Widget> sections = [];

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

  int selectedMenu = 0;

  @override
  void initState() {
    sections = [
      HeaderSection(
        scrollController: scrollController,
        nextSection: 800.0,
      ),
      BiographSection(
        scrollController: scrollController,
        nextSection: 1550.0,
      ),
      PortfolioSection(
        scrollController: scrollController,
        nextSection: 2350.0,
      ),
      ContactSection(),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    items = List.generate(sections.length, (index) => index.toDouble());

    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 70),
        child: BlocConsumer<SelectMenuCubit, int>(
          listener: (context, state) {},
          builder: (context, state) {
            return TopBarContents(
              scrollController: scrollController,
              items: items,
              selectedMenu: state,
            );
          },
        ),
      ),
      backgroundColor: mWhiteColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 715) {
              return desktopView(constraints, scrollController);
            } else {
              return mobileView();
            }
          },
        ),
      ),
    );
  }

  Widget desktopView(
      BoxConstraints constraints, ScrollController scrollController) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: List.generate(
          items.length,
          (index) => GetBoxOffset(
            offset: (offset) {
              items[index] = offset.dy;
            },
            child: sections[index],
          ),
        ),
      ),
    );
  }

  Widget mobileView() {
    return Container(
      child: Text('mobile'),
    );
  }
}

class ContactSection extends StatefulWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  bool formErrorValidation = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mBlackColor,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                top: 80,
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 90, horizontal: 112),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: mRedColor,
              ),
              child: Text(
                'GET IN\nTOUCH\nWITH\nME',
                style: bodyTextStyle.copyWith(fontSize: 48),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(
                  left: 60, top: 80, right: 150, bottom: 80),
              child: Form(
                key: _formKey,
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
                      height: 46,
                    ),
                    formErrorValidation
                        ? Text(
                            'Please complete the form first!',
                            style: bodyTextStyle.copyWith(
                              color: mRedColor,
                              fontSize: 14,
                            ),
                          )
                        : Container(),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          hintText: 'Your Name',
                          hintStyle: bodyTextStyle.copyWith(
                              fontSize: 20, color: mGreyColor),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 24),
                          errorStyle: bodyTextStyle.copyWith(
                              color: mRedColor, fontSize: 14),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Name is required';
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          hintText: 'Email',
                          hintStyle: bodyTextStyle.copyWith(
                              fontSize: 20, color: mGreyColor),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 24),
                          errorStyle: bodyTextStyle.copyWith(
                              color: mRedColor, fontSize: 14),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Email is required';
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        controller: _messageController,
                        keyboardType: TextInputType.text,
                        maxLines: 4,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          hintText: 'Your Message',
                          hintStyle: bodyTextStyle.copyWith(
                              fontSize: 20, color: mGreyColor),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 24),
                          errorStyle: bodyTextStyle.copyWith(
                              color: mRedColor, fontSize: 14),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Message is required';
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 46,
                    ),
                    SizedBox(
                      width: 400,
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() => formErrorValidation = false);
                              print('valid');
                            } else {
                              setState(() => formErrorValidation = true);
                              print('invalid');
                            }
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: mRedColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 7, horizontal: 23),
                            child: Text(
                              "SEND",
                              style: bodyTextStyle.copyWith(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PortfolioSection extends StatelessWidget {
  final ScrollController scrollController;
  final double nextSection;

  const PortfolioSection({
    Key? key,
    required this.scrollController,
    required this.nextSection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
                  style: titleTextStyle.copyWith(
                    color: mBlackColor,
                  ),
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
                          style: titleTextStyle.copyWith(
                            color: mBlackColor,
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  width: 313,
                  child: Divider(
                    thickness: 2,
                    color: mRedColor,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                  height: 360,
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    children: List.generate(6, (index) {
                      return PortfolioCard();
                    }),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      scrollController.animateTo(nextSection,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeIn);
                      BlocProvider.of<SelectMenuCubit>(context).selectMenu(3);
                    },
                    child: Image.asset(
                      'assets/images/down-arrow.png',
                      width: 34,
                      height: 34,
                    ),
                  ),
                ),
              ],
            ),
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

class BiographSection extends StatelessWidget {
  final ScrollController scrollController;
  final double nextSection;

  const BiographSection({
    Key? key,
    required this.scrollController,
    required this.nextSection,
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
                    child: InkWell(
                      onTap: () {
                        scrollController.animateTo(nextSection,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                        BlocProvider.of<SelectMenuCubit>(context).selectMenu(2);
                      },
                      child: Image.asset(
                        'assets/images/down-arrow.png',
                        width: 34,
                        height: 34,
                      ),
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
  final ScrollController scrollController;
  final double nextSection;

  const HeaderSection({
    Key? key,
    required this.scrollController,
    required this.nextSection,
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
                onPressed: () {
                  scrollController.animateTo(nextSection,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                  BlocProvider.of<SelectMenuCubit>(context).selectMenu(1);
                },
                style: TextButton.styleFrom(
                    backgroundColor: mBlackColor,
                    shape: const RoundedRectangleBorder(
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
