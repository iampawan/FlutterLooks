import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin {
  final pkImageUrl =
      "https://avatars0.githubusercontent.com/u/12619420?s=460&u=26db98cbde1dd34c7c67b85c240505a436b2c36d&v=4";
  final pic1 =
      "https://images.unsplash.com/photo-1533929736458-ca588d08c8be?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60";
  final pic2 =
      "https://images.unsplash.com/photo-1582050041567-9cfdd330d545?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60";
  TabController _tabController;
  double anim = 1.0;
  double anim2 = 0.1;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    withAnimation(
      tween: Tween(begin: 1.0, end: 0.0),
      vsync: this,
      callBack: (animationVal, controllerVal) {
        anim2 = animationVal;
        setState(() {});
      },
    );

    withRepeatAnimation(
      vsync: this,
      isRepeatReversed: true,
      tween: Tween(begin: 2.0, end: 3.0),
      callBack: (animationVal, controllerVal) {
        anim = animationVal;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.purple500,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: VStack([
          VxBox().size(20, 2).white.make(),
          5.heightBox,
          VxBox().size(28, 2).white.make(),
          5.heightBox,
          VxBox().size(15, 2).white.make(),
        ]).pOnly(left: 16, top: 16),
      ),
      body: VStack(
        [
          VxBox(
            child: [
              VxBox()
                  .square(100)
                  .bgImage(DecorationImage(image: NetworkImage(pkImageUrl)))
                  .roundedFull
                  .neumorphic(
                      color: Vx.purple500,
                      curve: VxCurve.concave,
                      elevation: 30.0)
                  .make(),
              "Hi, "
                  .richText
                  .white
                  .xl2
                  .withTextSpanChildren([
                    "Pawan".textSpan.white.bold.make(),
                  ])
                  .make()
                  .p8()
                  .offset(offset: Offset(-300 * anim2, 0.0)),
              "Solo Traveller".text.white.make(),
              VxTextField(
                borderType: VxTextFieldBorderType.none,
                borderRadius: 18,
                keyboardType: TextInputType.text,
                fillColor: Vx.gray200.withOpacity(0.3),
                hint: "Search",
                contentPaddingTop: 13,
                autofocus: false,
                borderColor: Colors.white,
                prefixIcon: Icon(Icons.search_outlined, color: Colors.white),
              )
                  .customTheme(
                      themeData: ThemeData(
                    brightness: Brightness.dark,
                    textSelectionTheme:
                        TextSelectionThemeData(cursorColor: Colors.white),
                  ))
                  .cornerRadius(10)
                  .p16()
            ].column(),
          ).makeCentered().h32(context),
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: VxBox(
                child: VStack([
              TabBar(
                indicatorColor: Colors.purple,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Vx.purple500,
                unselectedLabelColor: Vx.gray400,
                labelPadding: Vx.m16,
                isScrollable: false,
                tabs: [
                  Icon(
                    Icons.map,
                    size: 10,
                  ).scale(scaleValue: _tabController.index == 0 ? anim : 3.0),
                  Icon(
                    Icons.pin_drop,
                    size: 10,
                  ).scale(scaleValue: _tabController.index == 1 ? anim : 3.0),
                  Icon(
                    Icons.restaurant,
                    size: 10,
                  ).scale(scaleValue: _tabController.index == 2 ? anim : 3.0),
                  Icon(
                    Icons.person,
                    size: 10,
                  ).scale(scaleValue: _tabController.index == 3 ? anim : 3.0)
                ],
                controller: _tabController,
              ).h(context.percentHeight * 8),
              TabBarView(
                controller: _tabController,
                children: ["1", "2", "3", "4"]
                    .map((e) => VStack([
                          "Discover places in London"
                              .text
                              .gray600
                              .xl2
                              .bold
                              .make(),
                          20.heightBox,
                          TravelCard(
                            imgUrl: pic1,
                            title: "Tower Bridge",
                            subtitle: "Southwork",
                          ),
                          20.heightBox,
                          TravelCard(
                            imgUrl: pic2,
                            title: "London Eye",
                            subtitle: "Country Hall",
                          ),
                        ]).p16())
                    .toList(),
              ).expand(),
            ])).white.make(),
          ).expand(),
        ],
        axisSize: MainAxisSize.max,
      ).hFull(context),
    );
  }
}

class TravelCard extends StatelessWidget {
  final String title, subtitle, imgUrl;

  const TravelCard({Key key, this.title, this.subtitle, this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 1.seconds,
      child: HStack([
        Image.network(
          imgUrl,
          fit: BoxFit.cover,
        ).wh(context.percentWidth * 35, 100).cornerRadius(10),
        20.widthBox,
        [
          title.text.semiBold.make(),
          3.heightBox,
          subtitle.text.textStyle(context.captionStyle).make().shimmer(),
          5.heightBox,
          [
            VxRating(
              size: 13,
              onRatingUpdate: (value) {},
            ),
            5.widthBox,
            "(100)".text.xs.gray600.make(),
          ].hStack()
        ].column(crossAlignment: CrossAxisAlignment.start).expand(),
      ]).cornerRadius(8).backgroundColor(Vx.gray200),
    );
  }
}
