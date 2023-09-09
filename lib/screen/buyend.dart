import 'package:flutter/material.dart';
import 'package:cd_client/util/helper/enum.dart';
import 'package:cd_client/widget/atoms/button/primary_btn.dart';
import 'package:cd_client/util/constant/custom_color.dart';
import 'home.dart';

class BuyEnd extends StatelessWidget {
  const BuyEnd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.check_circle,
                size: 100,
                color: CustomColor.indigo,
              ),
              const SizedBox(height: 20),
              const Text(
                '결제가 완료되었습니다',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              PrimaryBtn(
                label: "홈 화면으로 이동",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                },
                widgetColor: WidgetColor.skyblue,
                widgetSize: WidgetSize.small,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
