import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

import '../main.dart';

import '../models/vpn_status.dart';
import '../services/vpn_engine.dart';
import '../widgets/count_down_timer.dart';
import '../widgets/home_card.dart';
import 'location_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    ///Add listener to update vpn state
    VpnEngine.vpnStageSnapshot().listen((event) {
      _controller.vpnState.value = event;
    });

    return Scaffold(
      backgroundColor: Colors.white,

      //app bar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Free VPN',
          style: TextStyle(color: Colors.black),
        ),
      ),

      //body
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        //vpn button
        Obx(() => _vpnButton()),

        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //country flag
              HomeCard(
                  title: _controller.vpn.value.countryLong.isEmpty
                      ? 'Country'
                      : _controller.vpn.value.countryLong,
                  subtitle: 'FREE',
                  icon: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue,
                    child: _controller.vpn.value.countryLong.isEmpty
                        ? Icon(Icons.vpn_lock_rounded,
                            size: 30, color: Colors.white)
                        : null,
                    backgroundImage: _controller.vpn.value.countryLong.isEmpty
                        ? null
                        : AssetImage(
                            'assets/flags/${_controller.vpn.value.countryShort.toLowerCase()}.png'),
                  )),

              //ping time
              HomeCard(
                  title: _controller.vpn.value.countryLong.isEmpty
                      ? '100 ms'
                      : '${_controller.vpn.value.ping} ms',
                  subtitle: 'PING',
                  icon: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.equalizer_rounded,
                        size: 30, color: Colors.white),
                  )),
            ],
          ),
        ),

        StreamBuilder<VpnStatus?>(
            initialData: VpnStatus(),
            stream: VpnEngine.vpnStatusSnapshot(),
            builder: (context, snapshot) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //download
                    HomeCard(
                        title: '${snapshot.data?.byteIn ?? '0 kbps'}',
                        subtitle: 'DOWNLOAD',
                        icon: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.lightGreen,
                          child: Icon(Icons.arrow_downward_rounded,
                              size: 30, color: Colors.white),
                        )),

                    //upload
                    HomeCard(
                        title: '${snapshot.data?.byteOut ?? '0 kbps'}',
                        subtitle: 'UPLOAD',
                        icon: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.arrow_upward_rounded,
                              size: 30, color: Colors.white),
                        )),
                  ],
                )),
        ElevatedButton.icon(
            icon: Icon(
              Icons.wifi,
              color: Colors.black,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffE8E9EA),
              fixedSize: Size(296, 56),
              shape: StadiumBorder(),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => LocationScreen()));
            },
            label: Text(
              "Change Server",
              style: TextStyle(color: Colors.black),
            )),
      ]),
    );
  }

  //vpn button
  Widget _vpnButton() => Column(
        children: [
          //button
          Semantics(
            button: true,
            child: InkWell(
              onTap: () {
                _controller.connectToVpn();
              },
              borderRadius: BorderRadius.circular(100),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _controller.getButtonColor.withOpacity(.1)),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _controller.getButtonColor.withOpacity(.3)),
                  child: Container(
                    width: mq.height * .14,
                    height: mq.height * .14,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _controller.getButtonColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //icon
                        Icon(
                          Icons.power_settings_new,
                          size: 28,
                          color: Colors.white,
                        ),

                        SizedBox(height: 4),

                        //text
                        Text(
                          _controller.getButtonText,
                          style: TextStyle(
                              fontSize: 12.5,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          //connection status label
          Container(
            margin:
                EdgeInsets.only(top: mq.height * .015, bottom: mq.height * .02),
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(15)),
            child: Text(
              _controller.vpnState.value == VpnEngine.vpnDisconnected
                  ? 'Not Connected'
                  : _controller.vpnState.replaceAll('_', ' ').toUpperCase(),
              style: TextStyle(fontSize: 12.5, color: Colors.white),
            ),
          ),

          //count down timer
          Obx(() => CountDownTimer(
              startTimer:
                  _controller.vpnState.value == VpnEngine.vpnConnected)),
        ],
      );

  //bottom nav to change location
}
