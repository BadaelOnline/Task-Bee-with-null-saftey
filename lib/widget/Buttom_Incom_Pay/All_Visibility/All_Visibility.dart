import 'package:flutter/material.dart';
import 'Visibility_Note/visibility_note.dart';
import 'Visibility_Repated_TransAction/visibal_repated_transaction.dart';
import 'visibility_Image/visibility_image.dart';

class AllVisibility extends StatefulWidget {
  const AllVisibility({Key? key, this.descriptionController}) : super(key: key);
  final TextEditingController? descriptionController;

  @override
  _AllVisibilityState createState() => _AllVisibilityState(descriptionController);
}

class _AllVisibilityState extends State<AllVisibility> {
  final TextEditingController? descriptionController;
  // TextEditingController totalController = TextEditingController();
  // TextEditingController paidController = TextEditingController();
  // TextEditingController descriptionController = TextEditingController();
  // TextEditingController exchangeIdController = TextEditingController();
  // TextEditingController walletIdController = TextEditingController();
  // TextEditingController contactIdController = TextEditingController();

  bool isVisabile = false;

  _AllVisibilityState(this.descriptionController);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            child: isVisabile == false
                ? Icon(
                    Icons.arrow_drop_down,
                    size: 35,
                  )
                : Icon(
                    Icons.arrow_drop_up,
                    size: 35,
                  ),
            onTap: () {
              setState(() {
                isVisabile = !isVisabile;
              });
              //
            },
          ),
        ),
        Visibility(
          visible: isVisabile,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibal_RepatedtransAction(),
                Visibility_Image(),
                Visibility_Note(des: descriptionController,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
