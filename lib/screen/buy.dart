import 'package:flutter/material.dart';
import 'package:cd_client/util/helper/enum.dart';
import 'package:cd_client/widget/atoms/button/primary_btn.dart';
import 'package:cd_client/widget/atoms/button/secondary_btn.dart';

class BuyInfo extends StatelessWidget {
  const BuyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('결제 확인'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildHeader('구매 정보', fontSize: 18, fontWeight: FontWeight.bold),
                _buildInfo('편의점'),
                _buildInfo('전화번호'),
                _buildDivider(),
                _buildHeader('상품 목록'),
                _buildInfo('상품1'),
                _buildInfo('상품2'),
                _buildInfo('상품3'),
                _buildInfo('상품4'),
                _buildInfo('상품5'),
                _buildDivider(),
                _buildInfo('상품 금액 :'),
                _buildInfo('배달 비용 :'),
                _buildDivider(),
                _buildHeader('결제 금액 :',
                    fontSize: 18, fontWeight: FontWeight.bold),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: PrimaryBtn(
                    label: "확인",
                    onPressed: () {},
                    widgetColor: WidgetColor.skyblue,
                    widgetSize: WidgetSize.small,
                  ),
                ),
                const SizedBox(width: 50.0),
                SizedBox(
                  width: 150,
                  child: SecondaryBtn(
                    label: "취소",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    widgetColor: WidgetColor.skyblue,
                    widgetSize: WidgetSize.small,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(String text, 
      {double fontSize = 18, FontWeight fontWeight = FontWeight.normal}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }

  Widget _buildInfo(String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(text),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      thickness: 3
    );
  }
}