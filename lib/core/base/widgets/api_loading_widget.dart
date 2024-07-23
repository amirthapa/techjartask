import 'package:flutter/material.dart';

class ApiLoadingWidget extends StatelessWidget {
  const ApiLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          height: 45,
          width: 45,
          alignment: FractionalOffset.center,
          child: const SizedBox(
            height: 45,
            width: 45,
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
