import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterlooks/coolors.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            color: Coolors.purplish,
          ),
          Container(
            width: context.screenWidth,
            height: context.percentHeight * 80,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                )),
            child: VStack([
              SvgPicture.asset(
                "assets/vaccum.svg",
                fit: BoxFit.cover,
              ).pOnly(bottom: 32, top: 60),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email address",
                  contentPadding: Vx.m2,
                  hintText: "mtechviral@gmail.com",
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                ),
              ).p16(),
              TextField(
                autofocus: true,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: Vx.m2,
                  border: OutlineInputBorder(),
                  labelText: "Enter password",
                  prefixIcon: Icon(
                    Icons.lock,
                  ),
                ),
              ).p16(),
              "Forgot password?"
                  .text
                  .sm
                  .caption(context)
                  .make()
                  .objectCenterRight()
                  .p16(),
              FlatButton(
                onPressed: () {},
                child: "Log In".text.bold.make(),
                color: Coolors.orangish,
                textColor: Colors.white,
              ).wh(context.screenWidth, 48).p16()
            ]),
          ),
          Positioned(
            child: VStack(
              [
                HStack(
                  [
                    SvgPicture.asset("assets/fb.svg"),
                    5.widthBox,
                    SvgPicture.asset("assets/google.svg"),
                    5.widthBox,
                    SvgPicture.asset("assets/twitter.svg"),
                  ],
                  alignment: MainAxisAlignment.center,
                ).wFull(context),
                16.heightBox,
                "Don't have an account? "
                    .richText
                    .white
                    .center
                    .withTextSpanChildren([
                  "Sign up here!".textSpan.color(Coolors.orangish).make()
                ]).makeCentered()
              ],
              alignment: MainAxisAlignment.center,
              crossAlignment: CrossAxisAlignment.center,
            ),
            bottom: 24,
          ),
        ],
      ),
    );
  }
}
