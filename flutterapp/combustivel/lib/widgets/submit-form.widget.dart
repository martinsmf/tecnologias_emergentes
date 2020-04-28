import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'dadosEntrada.dart';
import 'botoes.dart';

class SubmitForm extends StatelessWidget {
  //mascara de dinheiro
  var gasolinaCtrl = new MoneyMaskedTextController();
  var etanolCtrl = new MoneyMaskedTextController();
  var busy = false;
  Function submitFunc;

  SubmitForm({
    @required this.gasolinaCtrl,
    @required this.etanolCtrl,
    @required this.busy,
    @required this.submitFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: Input(
              label: "Gasolina",
              ctrl: gasolinaCtrl,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: Input(
              label: "Álcool",
              ctrl: etanolCtrl,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          LoadingButton(
            busy: busy,
            func: submitFunc,
            invert: false,
            text: "Calcular",
          ),
        ],
      ),
    );
  }
}
