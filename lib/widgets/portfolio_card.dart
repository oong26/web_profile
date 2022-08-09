import 'package:flutter/material.dart';
import 'package:web_profile/constants/colors.dart';
import 'package:web_profile/constants/fontstyle.dart';

class PortfolioCard extends StatelessWidget {
  const PortfolioCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/smile.png',
            width: 50,
          ),
          const SizedBox(
            height: 18,
          ),
          Text(
            'App Name',
            style: appTextStyle,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Lorem ipsum dolor sit amet',
            style: bodyTextStyle.copyWith(color: mGreyColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                backgroundColor: mBlackColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 23),
              child: Text(
                "Detail",
                style: bodyTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
