import 'package:financial/services/bloc/contact/cubit.dart';
import 'package:financial/services/bloc/contact/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardContact extends StatelessWidget {
  final Function()? delete;
  final Function()? edit;
  final Function()? onTap;
  final String? name;

  const CardContact({
    Key? key,
    this.delete,
    this.edit,
    this.name,
    this.onTap,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      // () => Navigator.of(context).pushNamed('/previewcontact'),
      child: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.person,
                      color: Colors.grey[500],
                      size: 35,
                    )
                    // Image.asset(
                    //   'assets/image/user.png',
                    //   width: 40,
                    //   height: 40,
                    // ),
                    ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  '$name',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ]),
              Row(children: [
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.grey[500],
                  ),
                  onPressed: edit,
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.grey[500],
                  ),
                  onPressed: delete,
                ),
              ]),
            ],
          )),
    );
  }
}
