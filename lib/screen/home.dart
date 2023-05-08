import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toss_clone/widget/home_card.dart';
import 'package:toss_clone/widget/item.dart';
import 'package:toss_clone/widget/item_menu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  double elevation = 0;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      elevation = _scrollController.offset == 0 ? 0 : 3;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15 + 80),
        children: [
          // TossBank(),
          const ItemMenu(title: '토스 뱅크'),
          const SizedBox(height: 20),
          ItemMenu(
            title: "자산",
            children: [
              Item(
                icon: const Icon(
                  Icons.payment,
                  color: Colors.white,
                ),
                title: makeTitle(
                  upperText: "보통 예금(신IBK급여통장)",
                  lowerText: "잔액 보기",
                ),
                rightWidget: makeRightButton("송금"),
              ),
              Item(
                icon: const Icon(
                  Icons.payment,
                  color: Colors.white,
                ),
                title: makeTitle(
                  upperText: "보통 예금(신IBK급여통장)",
                  lowerText: "잔액 보기",
                ),
                rightWidget: makeRightButton("송금"),
              ),
              Item(
                icon: const Icon(
                  Icons.payment,
                  color: Colors.white,
                ),
                title: makeTitle(
                  upperText: "보통 예금(신IBK급여통장)",
                  lowerText: "잔액 보기",
                ),
                rightWidget: makeRightButton("송금"),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const ItemMenu(
            title: "투자",
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 200,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                },
                scrollbars: true,
              ),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 100,
                itemBuilder: (context, index) => HomeCard(
                  icon: Icon(
                    FontAwesomeIcons.sackDollar,
                    color: Colors.yellow.shade600,
                    size: 48,
                  ),
                  upperText: "59개 금융사",
                  lowerText: "대출 상품 보기",
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 20),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text("Hi"),
              Text("Hi"),
              Text("Hi"),
              Item(icon: Icon(Icons.settings), title: Text("hi")),
              // Item(icon: Icon(Icons.settings), title: Text("hi"))
            ],
          )
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
