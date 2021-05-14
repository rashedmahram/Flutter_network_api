import 'package:earth_quake_app/widgets/info_card.dart';
import 'package:earth_quake_app/widgets/preventions_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.03),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Wrap(
              spacing: 10, //horizontal
              runSpacing: 20, // vertical
              children: [
                InfoCard(
                  title: "Confirmed Cases",
                  effectNumber: 1605,
                  iconColor: Color(0xffff9c00),
                ),
                InfoCard(
                  title: "Total Deaths",
                  effectNumber: 160,
                  iconColor: Color(0xffff2d55),
                ),
                InfoCard(
                  title: "Total Recover",
                  effectNumber: 160,
                  iconColor: Color(0xFF50E3C2),
                ),
                InfoCard(
                  title: "New Cases",
                  effectNumber: 1060,
                  iconColor: Color(0xff5856d6),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Preventions",
                  style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              buildPreventionsCard(),
              SizedBox(height: 20),
              buildHelpCard(context),
            ],
          ),
        ],
      ),
    );
  }

  Row buildPreventionsCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PreventionsCard(image: "assets/icons/use_mask.svg", title: "Use Mask"),
        PreventionsCard(image: "assets/icons/hand_wash.svg", title: "Hand Wash"),
        PreventionsCard(image: "assets/icons/Clean_Disinfect.svg", title: "Clean Disinfect"),
      ],
    );
  }

  Container buildHelpCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            height: 170,
            width: double.infinity,
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.4,
              top: 45,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  Color(0xff60b393),
                  Color(0xff1b8d59),
                ],
              ),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Dail 999 for\nMedical Help\n",
                    style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
                  ),
                  TextSpan(
                    text: "If any symptoms appear",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: SvgPicture.asset("assets/icons/virus.svg"),
          ),
          SvgPicture.asset("assets/icons/nurse.svg"),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(0.03),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/menu.svg",
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
          ),
        )
      ],
    );
  }
}
