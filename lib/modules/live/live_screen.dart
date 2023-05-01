import 'package:coza_app/res/color_palette.dart';
import 'package:coza_app/res/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/helpers.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Live",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                                height: 1,
                                color: primaryColor),
                          ),
                        ],
                      ),
                    )),
                    Text(
                      "Start Radio",
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.0),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    SvgPicture.asset(
                      LIVE_STREAM_ICON,
                      height: 30.0,
                      width: 50.0,
                    ),
                  ],
                ),
              ),

              // give the tab bar a height [can change hheight to preferred height]
              Container(
                height: 45,
                child: TabBar(
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black38,
                  labelStyle: const TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold),
                  unselectedLabelStyle: const TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold),
                  indicator: null,
                  indicatorColor: Colors.transparent,
                  tabs: const [
                    // first tab [you can add an icon using the icon property]
                    Tab(
                      child: Text("COZA TV", textAlign: TextAlign.start),
                    ),
                    // second tab [you can add an icon using the icon property]
                    Tab(
                      text: 'Live Stream',
                    ),
                  ],
                ),
              ),
              // tab bar view here
              Container(
                height: deviceHeight(context) * 0.7,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        livestreamSlider(context, PB_IMAGE, PB_AVATAR_IMAGE, "Biodun Fatoyinbo"),
                        livestreamSlider(context, DEDICATION_IMAGE, MUMMY_DEE_AVATAR_IMAGE, "Modele Fatoyinbo")
                      ],
                    ),

                    // second tab bar view widget
                    Center(
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding livestreamSlider(BuildContext context, String  imageString, String avatarImage, String channelName) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0, left: 8.0),
      child: Container(
        width: deviceWidth(context) - 100,
        height: deviceHeight(context) * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: deviceWidth(context) - 50,
              height: deviceHeight(context) * 0.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(imageString), fit: BoxFit.fitHeight)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage(avatarImage), fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          channelName,
                          style: TextStyle(
                              fontSize: 13.0, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "14.1k Subscribers",
                          style: TextStyle(fontSize: 10.0),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(CupertinoIcons.link, size: 15.0),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final double radius;
  late Color color;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint _paint;
    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
