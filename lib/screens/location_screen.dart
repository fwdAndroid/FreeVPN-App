import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/location_controller.dart';
import '../main.dart';
import '../widgets/vpn_card.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({super.key});

  final _controller = LocationController();

  @override
  Widget build(BuildContext context) {
    if (_controller.vpnList.isEmpty) _controller.getVpnData();

    return Obx(
      () => SafeArea(
        child: Scaffold(
          //app bar
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(107.0),
            child: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                  top: Radius.circular(30),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      _controller.getVpnData();
                    },
                    icon: Icon(
                      Icons.refresh,
                    ))
              ],
              backgroundColor: Color(0xff185BFF),
              title: Text('Countries'),
            ),
          ),

          //refresh button

          body: _controller.isLoading.value
              ? _loadingWidget()
              : _controller.vpnList.isEmpty
                  ? _noVPNFound()
                  : _vpnData(),
        ),
      ),
    );
  }

  _vpnData() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Free Locations (${_controller.vpnList.length})"),
          ),
          SizedBox(
            height: 530,
            child: ListView.builder(
                itemCount: _controller.vpnList.length,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                    top: mq.height * .015,
                    bottom: mq.height * .1,
                    left: mq.width * .04,
                    right: mq.width * .04),
                itemBuilder: (ctx, i) => VpnCard(vpn: _controller.vpnList[i])),
          ),
        ],
      );

  _loadingWidget() => SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //lottie animation
            LottieBuilder.asset('assets/lottie/loading.json',
                width: mq.width * .7),

            //text
            Text(
              'Loading VPNs... 😌',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      );

  _noVPNFound() => Center(
        child: Text(
          'VPNs Not Found! 😔',
          style: TextStyle(
              fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold),
        ),
      );
}
