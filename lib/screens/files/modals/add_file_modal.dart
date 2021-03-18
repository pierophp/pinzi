import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pinzi/helpers/snackbar_helper.dart';
import 'package:pinzi/widgets/custom_button.dart';
import 'package:pinzi/widgets/custom_typography.dart';
import 'package:pinzi/widgets/input.dart';

class AddFileModal extends StatefulWidget {
  AddFileModal({
    Key? key,
  }) : super(key: key);

  @override
  createState() => _AddFileModalState();
}

class _AddFileModalState extends State<AddFileModal> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _urlController;

  bool _buttonLoading = false;

  _AddFileModalState();

  initState() {
    super.initState();
    _titleController = TextEditingController();
    _urlController = TextEditingController();
  }

  onPressed() async {
    try {
      setState(() {
        _buttonLoading = true;
      });

      final form = _formKey.currentState!;
      if (!form.validate()) {
        return;
      }

      final url =
          "https://api.pinzi.org/site/download?language=pt&ideogramType=s&url=${this._urlController.text}";

      Dio().get(url).then(
        (response) {
          if (this.mounted) {}
        },
      );

      SnackbarHelper.show(
        context: context,
        text: 'Arquivo criado com sucesso!',
      );

      Navigator.pop(context);
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        _buttonLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.fromLTRB(24, 32, 24, 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CustomTypography(
              text: "CRIAR ARQUIVO",
              fontFamily: FontFamily.barlow_condensed,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              color: Colors.black,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Input(
              labelText: "Título",
              controller: _titleController,
              hintText: "Preencha o título",
              inputType: TextInputType.text,
              state: InputState.normal,
              validator: (val) {
                if (val == "") {
                  return "Preencha o título";
                }

                return null;
              },
            ),
            SizedBox(height: 24),
            Input(
              labelText: "URL",
              controller: _urlController,
              hintText: "Preencha a URL",
              inputType: TextInputType.text,
              state: InputState.normal,
              validator: (val) {
                if (val == "") {
                  return "Preencha a URL";
                }

                return null;
              },
            ),
            SizedBox(height: 24.0),
            CustomButton(
              icon: Icons.save,
              iconPosition: IconPosition.leading,
              buttonText: "Salvar",
              loading: _buttonLoading,
              onPressed: this.onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
