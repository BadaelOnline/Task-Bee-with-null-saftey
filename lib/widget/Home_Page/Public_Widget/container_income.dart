import 'package:flutter/material.dart';

class ContainerIncome extends StatelessWidget {
  const ContainerIncome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed('/revenuesHome'),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.32,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Image.asset(
                  'assets/homepage/plus.png',
                  height: 33,
                  width: 33,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Income',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontSize: 15),
                ),
              ],
            ),
            Column(
              children: [
                Divider(
                  color: Color(0xff16b6a1),
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '100,500.00 ',
                      style: TextStyle(
                          color: Color(0xff16b6a1),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Text(
                      'S.P',
                      style: TextStyle(
                          color: Color(0xff16b6a1),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
                Divider(
                  color: Color(0xff16b6a1),
                  thickness: 1,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
