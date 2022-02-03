import 'package:flutter/material.dart';

class CardTask extends StatelessWidget {
  final String image;
  final String type;
  final String title;
  final String from;
  final String to;
  final String importance;
  final String repate;
  final String allday;
  const CardTask({
    Key? key,
    required this.image,
    required this.type,
    required this.title,
    required this.from,
    required this.to,
    required this.importance,
    required this.repate,
    required this.allday,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 35, height: 35, child: Image.asset(image)),
                  Text(type)
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      repate == ''
                          ? Container(
                              width: 22,
                              height: 22,
                            )
                          : Container(
                              width: 22,
                              height: 22,
                              child: Image.asset(repate),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      importance == ''
                          ? Container(
                              width: 22,
                              height: 22,
                            )
                          : Container(
                              width: 22,
                              height: 22,
                              child: Image.asset(importance),
                            )
                    ],
                  ),
                ),
                VerticalDivider(thickness: 1),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        from == '' && to == ''
                            ? Row(
                                children: [Text(allday)],
                              )
                            : Column(
                                children: [
                                  Row(
                                    children: [Text(from)],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [Text(to)],
                                  )
                                ],
                              )
                      ]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
