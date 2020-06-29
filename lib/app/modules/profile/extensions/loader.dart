import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart' as asuka;

extension LoaderStateless on StatelessWidget {
  showLoader(BuildContext context) {
    asuka.showDialog(
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(thirdColor),
                ),
              ),
              SizedBox(height: 20),
              Text("Buscando...."),
            ],
          ),
        ),
      ),
    );
  }

  hideLoader(BuildContext context) {
    Navigator.of(context).pop();
  }
}
