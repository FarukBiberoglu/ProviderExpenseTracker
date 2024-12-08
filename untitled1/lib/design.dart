import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DesingPage extends StatelessWidget {
  DesingPage({super.key,required this.type,required this.amount});

  String type ;
  int amount ;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 110,
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 2.4,
            color: Colors.grey.withOpacity(0.5),
          ),
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(18),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.5,
                ),
              ),
              const SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.only(left: 0.4),
                child: Text(
                  "$amount",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 14, 16, 41),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
