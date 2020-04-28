import 'package:aog/widgets/dadosEntrada.dart';
import 'package:aog/widgets/botoes.dart';
import 'package:aog/widgets/logoTipo.dart';
import 'package:aog/widgets/submit-form.widget.dart';
import 'package:aog/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.deepPurple;
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa utilizar álcool";
  var _precoGasolinaController = new MoneyMaskedTextController();
  var _precoEtanolController = new MoneyMaskedTextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 1200,
        ),
        color: _color,
        child: ListView(
          children: <Widget>[
            Logo(),
            _completed
                ? Success(
                    result: _resultText,
                    resetFields: reset,
                  )
                : SubmitForm(
                    etanolCtrl: _precoEtanolController,
                    gasolinaCtrl: _precoGasolinaController,
                    busy: _busy,
                    submitFunc: calcula,
                  ),
          ],
        ),
      ),
    );
  }

  Future calcula() {
    double etanol =
        double.parse(_precoEtanolController.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double gasolina =
        double.parse(_precoGasolinaController.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double resultado = etanol / gasolina;

    setState(() {
      _color = Colors.deepOrange[200];
      _completed = false;
      _busy = true;
    });

    return new Future.delayed(
        const Duration(seconds: 1),
        () => {
              setState(() {
                if (resultado >= 0.7) {
                  _resultText = "Gasolina é a mehor opção";
                } else {
                  _resultText = "Etanol é a melhor opção";
                }

                _busy = false;
                _completed = true;
              })
            });
  }

  reset() {
    setState(() {
      _color = Colors.deepPurple;
      _precoEtanolController = new MoneyMaskedTextController();
      _precoGasolinaController = new MoneyMaskedTextController();
      _completed = false;
      _busy = false;
    });
  }
}
