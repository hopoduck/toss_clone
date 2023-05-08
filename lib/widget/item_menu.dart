import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  final String title;
  final List<Widget>? children;

  const ItemMenu({
    super.key,
    required this.title,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return children == null
        ? Ink(
            decoration: const BoxDecoration(
              color: Color(0xff424242),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: InkWell(
              onTap: () {},
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          )
        : Ink(
            decoration: const BoxDecoration(
              color: Color(0xff424242),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                InkWell(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                ),
                ...children!,
              ],
            ),
          );
  }
}
