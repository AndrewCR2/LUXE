import 'package:flutter/material.dart';

displayGoodAlert(
    {required BuildContext context,
    required IconData icon,
    required String message,
    required Color color}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 110,
                ),
                const SizedBox(height: 30),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade900),
                )
              ],
            ),
            actions: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      child: const Text('Ok',
                          style: TextStyle(fontSize: 18, color: Colors.indigo)),
                      onPressed: () => Navigator.pop(context)),
                ],
              )
            ],
          ));
}
