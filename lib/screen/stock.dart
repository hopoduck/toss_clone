import 'package:flutter/material.dart';
import 'package:toss_clone/widget/rolling_item.dart';

class Stock extends StatefulWidget {
  const Stock({super.key});

  @override
  State<Stock> createState() => _StockState();
}

class _StockState extends State<Stock> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late final TabController _tabController;
  double elevation = 0;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      elevation = _scrollController.offset == 0 ? 0 : 3;
    });
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15 + 80),
      child: Column(
        // physics: const BouncingScrollPhysics(),
        // controller: _scrollController,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                const Text(
                  "토스 증권",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(width: 10),
                RollingItem(
                  height: 22,
                  children: [
                    Container(
                      width: 200,
                      height: 22,
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(),
                      child: const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: "코스피"),
                            WidgetSpan(child: SizedBox(width: 5)),
                            TextSpan(
                              text: "2500.94",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 22,
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(),
                      child: const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: "코스닥"),
                            WidgetSpan(child: SizedBox(width: 5)),
                            TextSpan(
                              text: "845.06",
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 22,
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(),
                      child: const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: "나스닥"),
                            WidgetSpan(child: SizedBox(width: 5)),
                            TextSpan(
                              text: "12235.41",
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 22,
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(),
                      child: const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: "환율"),
                            WidgetSpan(child: SizedBox(width: 5)),
                            TextSpan(
                              text: "1320.36",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            // padding: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  child: const Text(
                    "내 주식",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  child: const Text(
                    "오늘의 발견",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "최근 본 주식",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "최근 1달 이내에 본 주식이 없어요",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    divider(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        // horizontal: 30,
                        vertical: 40,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              "관심 주식",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text("추가한 주식의 소식을 빠르게 알려드려요"),
                          ),
                          SizedBox(height: 30),
                          StockItem(),
                          StockItem(),
                          StockItem(),
                          StockItem(),
                        ],
                      ),
                    ),
                    divider(),
                  ],
                ),
                const SizedBox(
                  height: 600,
                  child: Text("hi"),
                ),
              ],
            ),
          )
          // // TossBank(),
          // const ItemMenu(title: '토스 뱅크'),
          // const SizedBox(height: 20),
          // ItemMenu(
          //   title: "자산",
          //   children: [
          //     Item(
          //       icon: const Icon(
          //         Icons.payment,
          //         color: Colors.white,
          //       ),
          //       title: makeTitle(
          //         upperText: "보통 예금(신IBK급여통장)",
          //         lowerText: "잔액 보기",
          //       ),
          //       rightWidget: makeRightButton("송금"),
          //     ),
          //     Item(
          //       icon: const Icon(
          //         Icons.payment,
          //         color: Colors.white,
          //       ),
          //       title: makeTitle(
          //         upperText: "보통 예금(신IBK급여통장)",
          //         lowerText: "잔액 보기",
          //       ),
          //       rightWidget: makeRightButton("송금"),
          //     ),
          //     Item(
          //       icon: const Icon(
          //         Icons.payment,
          //         color: Colors.white,
          //       ),
          //       title: makeTitle(
          //         upperText: "보통 예금(신IBK급여통장)",
          //         lowerText: "잔액 보기",
          //       ),
          //       rightWidget: makeRightButton("송금"),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 20),
          // const ItemMenu(
          //   title: "투자",
          // ),
          // const SizedBox(height: 20),
          // SizedBox(
          //   width: double.infinity,
          //   height: 200,
          //   child: ScrollConfiguration(
          //     behavior: ScrollConfiguration.of(context).copyWith(
          //       dragDevices: {
          //         PointerDeviceKind.mouse,
          //         PointerDeviceKind.touch,
          //       },
          //       scrollbars: true,
          //     ),
          //     child: ListView.separated(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: 100,
          //       itemBuilder: (context, index) => HomeCard(
          //         icon: Icon(
          //           FontAwesomeIcons.sackDollar,
          //           color: Colors.yellow.shade600,
          //           size: 48,
          //         ),
          //         upperText: "59개 금융사",
          //         lowerText: "대출 상품 보기",
          //       ),
          //       separatorBuilder: (context, index) =>
          //           const SizedBox(width: 20),
          //     ),
          //   ),
          // ),
          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: const [
          //     Text("Hi"),
          //     Text("Hi"),
          //     Text("Hi"),
          //     Item(icon: Icon(Icons.settings), title: Text("hi")),
          //     // Item(icon: Icon(Icons.settings), title: Text("hi"))
          //   ],
          // )
          // SizedBox(height: 20),
          // MyMoney(),
          // SizedBox(height: 20),
          // MyMoney(),
          // SizedBox(height: 20),
          // MyMoney(),
          // SizedBox(height: 20),
          // MyMoney(),
          // SizedBox(height: 20),
          // MyMoney(),
          // SizedBox(height: 20),
          // MyMoney(),
          // SizedBox(height: 20),
          // MyMoney(),
          // SizedBox(height: 20),
          // MyMoney(),
        ],
      ),
    );
  }

  Container divider() {
    return Container(
      width: double.infinity,
      height: 20,
      color: const Color(0xff252525),
    );
  }

  InkWell makeRightButton(String text) {
    return InkWell(
      onTap: () {},
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      child: Ink(
        padding: const EdgeInsets.all((40 - 12) / 2),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Column makeTitle({required String upperText, required String lowerText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          upperText,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          lowerText,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class StockItem extends StatefulWidget {
  const StockItem({
    super.key,
  });

  @override
  State<StockItem> createState() => _StockItemState();
}

class _StockItemState extends State<StockItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue,
                ),
                const SizedBox(width: 15),
                SizedBox(
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "삼성전자",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "2,964,685명 추가",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {},
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              child: Ink(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xff404040),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: const Text("추가"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
