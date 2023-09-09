import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/item.dart';
import 'package:bootpay/model/payload.dart';
import 'package:bootpay/model/user.dart';
import 'package:cd_client/screen/buyend.dart';
import 'package:cd_client/screen/shopping.dart';
import 'package:cd_client/util/helper/common.dart';
import 'package:cd_client/util/helper/enum.dart';
import 'package:cd_client/widget/atoms/button/primary_btn.dart';
import 'package:cd_client/widget/atoms/button/secondary_btn.dart';
import 'package:flutter/material.dart';
import 'package:bootpay/bootpay.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BuyInfo extends StatefulWidget {
  final List<ProductTemp> shoppingItems;

  const BuyInfo({Key? key, required this.shoppingItems}) : super(key: key);

  @override
  State<BuyInfo> createState() => _BuyInfoState();
}

class _BuyInfoState extends State<BuyInfo> {
  Payload payload = Payload();

  String webApplicationId = dotenv.env["BOOTPAY_WEB"]!;
  String androidApplicationId = dotenv.env['BOOTPAY_ANDROID']!;
  String iosApplicationId = dotenv.env['BOOTPAY_IOS']!;

  String get applicationId {
    return Bootpay().applicationId(
        webApplicationId, androidApplicationId, iosApplicationId);
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
    return const Divider(thickness: 3);
  }

  void bootpayReqeustDataInit() {
    Item item1 = Item();
    item1.name = "미키 '마우스"; // 주문정보에 담길 상품명
    item1.qty = 1; // 해당 상품의 주문 수량
    item1.id = "ITEM_CODE_MOUSE"; // 해당 상품의 고유 키
    item1.price = 500; // 상품의 가격

    Item item2 = Item();
    item2.name = "키보드"; // 주문정보에 담길 상품명
    item2.qty = 1; // 해당 상품의 주문 수량
    item2.id = "ITEM_CODE_KEYBOARD"; // 해당 상품의 고유 키
    item2.price = 500; // 상품의 가격

    List<Item> itemList = [item1, item2];

    payload.webApplicationId = webApplicationId; // web application id
    payload.androidApplicationId =
        androidApplicationId; // android application id
    payload.iosApplicationId = iosApplicationId; // ios application id

    payload.pg = '케이씨피';
    payload.methods = ['card', 'phone', 'vbank', 'bank', 'kakao'];
    payload.orderName = "테스트 상품"; //결제할 상품명
    payload.price = 1000.0; //정기결제시 0 혹은 주석
    payload.items = itemList;

    payload.orderId = DateTime.now()
        .millisecondsSinceEpoch
        .toString(); //주문번호, 개발사에서 고유값으로 지정해야함

    User user = User(); // 구매자 정보
    user.username = "사용자 이름";
    user.email = "user1234@gmail.com";
    user.area = "서울";
    user.phone = "010-4033-4678";
    user.addr = '서울시 동작구 상도로 222';

    Extra extra = Extra(); // 결제 옵션
    extra.appScheme = 'bootpayFlutterExample';
    extra.cardQuota = '3';
    // extra.openType = 'popup';

    // extra.carrier = "SKT,KT,LGT"; //본인인증 시 고정할 통신사명
    // extra.ageLimit = 20; // 본인인증시 제한할 최소 나이 ex) 20 -> 20살 이상만 인증이 가능

    payload.user = user;
    payload.extra = extra;
    payload.extra?.openType = "iframe";
  }

  //버튼클릭시 부트페이 결제요청 실행
  void _payment() {
    Bootpay().requestPayment(
      context: context,
      payload: payload,
      showCloseButton: false,
      // closeButton: Icon(Icons.close, size: 35.0, color: Colors.black54),
      onCancel: (String data) {
        print('------- onCancel: $data');
      },
      onError: (String data) {
        print('------- onCancel: $data');
      },
      onClose: () {
        print('------- onClose');
        Bootpay().dismiss(context); //명시적으로 부트페이 뷰 종료 호출
        CommonHelper.navigateScreen(context, const BuyEnd());
        //TODO - 원하시는 라우터로 페이지 이동
      },

      onIssued: (String data) {
        print('------- onIssued: $data');
      },
      onConfirm: (String data) {
        return true;
        /**
            1. 바로 승인하고자 할 때
            return true;
         **/
        /***
            2. 비동기 승인 하고자 할 때
            checkQtyFromServer(data);
            return false;
         ***/
        /***
            3. 서버승인을 하고자 하실 때 (클라이언트 승인 X)
            return false; 후에 서버에서 결제승인 수행
         */
        // checkQtyFromServer(data);
        // return false;
      },
      onDone: (String data) {
        print('------- onDone: $data');
        CommonHelper.navigateScreen(context, const BuyEnd());
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bootpayReqeustDataInit(); //결제용 데이터 init
  }

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
                _buildHeader('구매 정보',
                    fontSize: 18, fontWeight: FontWeight.bold),
                _buildInfo('구매 장소 : '),
                _buildInfo('배달 장소 : '),
                _buildDivider(),
                _buildHeader('상품 목록'),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.shoppingItems.length,
                  itemBuilder: (context, index) {
                    final item = widget.shoppingItems[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item.name),
                          Text('${item.count}개'),
                        ],
                      ),
                    );
                  },
                ),
                _buildDivider(),
                _buildInfo('상품 금액 : '),
                _buildInfo('배달 비용 : '),
                _buildDivider(),
                _buildHeader('결제 금액 : ',
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
                    onPressed: _payment,
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
}

// dynamic json = {
//   "event": "done",
//   "data": {
//     "receipt_id": "64fbf995d25985002208fc14",
//     "order_id": "1694235028269",
//     "price": 1000,
//     "tax_free": 0,
//     "cancelled_price": 0,
//     "cancelled_tax_free": 0,
//     "order_name": "테스트 상품",
//     "company_name": "clickdeliverus",
//     "gateway_url": "https://gw.bootpay.co.kr",
//     "metadata": {},
//     "sandbox": true,
//     "pg": "KCP",
//     "method": "카드",
//     "method_symbol": "card",
//     "method_origin": "카드",
//     "method_origin_symbol": "card",
//     "purchased_at": "2023-09-09T13:51:11+09:00",
//     "requested_at": "2023-09-09T13:50:29+09:00",
//     "status_locale": "결제완료",
//     "currency": "KRW",
//     "receipt_url":
//         "https://door.bootpay.co.kr/receipt/Y1l0Y2pGNjJkekkwdW5MYmFwNmVxRnc5R2RqM3dQMTEzRVJJV1NnZDR4ZDhN%0Adz09LS1qcEpCREMwTkRLczJpbHpYLS1nYUdIZVFJMzVOQXlNelRRNTNOUHpB%0APT0%3D%0A",
//     "status": 1,
//     "card_data": {
//       "tid": "23502998785246",
//       "card_approve_no": "83254804",
//       "card_no": "4619540000005596",
//       "card_quota": "00",
//       "card_company_code": "CCLG",
//       "card_company": "신한카드",
//       "point": 0,
//       "coupon": 0
//     }
//   }
// };
