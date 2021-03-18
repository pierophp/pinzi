import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:pinzi/widgets/custom_loader.dart';
import 'package:pinzi/widgets/custom_typography.dart';

class DictionaryTitle extends StatelessWidget {
  final String title;

  const DictionaryTitle(
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 15),
      Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
              decoration: BoxDecoration(
                color: Colors.blue[50],
              ),
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: FontFamily.barlow_condensed,
                ),
              ),
            ),
          ),
        ],
      )
    ]);
  }
}

class DictionaryDescription extends StatelessWidget {
  final String description;

  const DictionaryDescription(
    this.description, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.barlow_condensed,
        fontSize: 17.0,
      ),
    );
  }
}

class DictionaryModal extends StatefulWidget {
  final String ideograms;
  final String pinyin;

  DictionaryModal({
    Key? key,
    required this.ideograms,
    required this.pinyin,
  }) : super(key: key);

  @override
  _DictionaryModalState createState() => _DictionaryModalState();
}

class DictionaryList {
  List<String> pinziPt;
  List<String> pinziEs;
  List<String> pinziEn;
  List<String> glosbePt;
  List<String> glosbeEs;
  List<String> glosbeEn;
  List<String> cedict;
  List<String> unihan;
  List<String> chineseToolsPt;
  List<String> chineseToolsEs;
  List<String> chineseToolsEn;
  List<String> measureWords;
  List<String> variants;
  int? hsk;
  bool? isSeparable;

  DictionaryList({
    required this.pinziPt,
    required this.pinziEs,
    required this.pinziEn,
    required this.glosbePt,
    required this.glosbeEs,
    required this.glosbeEn,
    required this.chineseToolsPt,
    required this.chineseToolsEs,
    required this.chineseToolsEn,
    required this.cedict,
    required this.unihan,
    required this.measureWords,
    required this.variants,
    this.hsk,
    this.isSeparable,
  });
}
// @todo
// Improve This

class DictionaryMoedictDefinition {
  List<String> def;

  DictionaryMoedictDefinition({
    required this.def,
  });
}

class DictionaryMoedict {
  List<DictionaryMoedictDefinition> pinyinDefinitions;
  List<DictionaryMoedictDefinition> traditionalDefinitions;
  List<DictionaryMoedictDefinition> simplifiedDefinitions;

  DictionaryMoedict({
    required this.pinyinDefinitions,
    required this.traditionalDefinitions,
    required this.simplifiedDefinitions,
  });
}

class _DictionaryModalState extends State<DictionaryModal> {
  DictionaryList? dictionaryList;
  DictionaryMoedict? dictionaryMoedict;

  @override
  Widget build(BuildContext context) {
    final url =
        "https://api.pinzi.org/unihan/dictionary?ideograms=${widget.ideograms}&pinyin=${widget.pinyin}";

    Dio().get(url).then(
      (response) {
        setState(() {
          dictionaryList = _convertResponseToDictionaryList(response.data);
        });
      },
    );

    final moedictUrl =
        "https://api.pinzi.org/dictionary/moedict?ideogram=${widget.ideograms}&pronunciation=${widget.pinyin}";

    Dio().get(moedictUrl).then(
      (response) {
        setState(() {
          dictionaryMoedict =
              _convertResponseToDictionaryMoedict(response.data);
        });
      },
    );

    Widget dictionaryComponent = Column(children: [
      SizedBox(height: 20),
      CustomLoader(),
    ]);
    if (dictionaryList != null) {
      dictionaryComponent = _getDictionaryDetails();
    }

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getDictionaryTitle(),
            dictionaryComponent,
          ],
        ),
      ),
    );
  }

  DictionaryList _convertResponseToDictionaryList(dynamic data) {
    return DictionaryList(
      pinziPt:
          (data["pt"] ?? []).map<String>((item) => item.toString()).toList(),
      pinziEs:
          (data["es"] ?? []).map<String>((item) => item.toString()).toList(),
      pinziEn:
          (data["en"] ?? []).map<String>((item) => item.toString()).toList(),
      glosbePt: (data["glosbe_pt"] ?? [])
          .map<String>((item) => item.toString())
          .toList(),
      glosbeEs: (data["glosbe_es"] ?? [])
          .map<String>((item) => item.toString())
          .toList(),
      glosbeEn: (data["glosbe_en"] ?? [])
          .map<String>((item) => item.toString())
          .toList(),
      cedict: (data["cedict"] ?? [])
          .map<String>((item) => item.toString())
          .toList(),
      unihan: (data["unihan"] ?? [])
          .map<String>((item) => item.toString())
          .toList(),
      chineseToolsPt: (data["chinese_tools_pt"] ?? [])
          .map<String>((item) => item.toString())
          .toList(),
      chineseToolsEs: (data["chinese_tools_es"] ?? [])
          .map<String>((item) => item.toString())
          .toList(),
      chineseToolsEn: (data["chinese_tools_en"] ?? [])
          .map<String>((item) => item.toString())
          .toList(),
      measureWords: (data["measure_words"] ?? [])
          .map<String>((item) => item.toString())
          .toList(),
      variants: (data["variants"] ?? [])
          .map<String>((item) => item.toString())
          .toList(),
      hsk: data["hsk"],
      isSeparable: data["is_separable"],
    );
  }

  DictionaryMoedict _convertResponseToDictionaryMoedict(dynamic data) {
    print(data["definition"]["traditionalDefinitions"]);

    return DictionaryMoedict(
      pinyinDefinitions: (data["definition"]["pinyinDefinitions"] ?? [])
          .map<DictionaryMoedictDefinition>(
            (item) => DictionaryMoedictDefinition(
              def: item.def,
            ),
          )
          .toList(),
      simplifiedDefinitions: (data["definition"]["simplifiedDefinitions"] ?? [])
          .map<DictionaryMoedictDefinition>(
            (item) => DictionaryMoedictDefinition(
              def: item.def,
            ),
          )
          .toList(),
      traditionalDefinitions:
          (data["definition"]["traditionalDefinitions"] ?? [])
              .map<DictionaryMoedictDefinition>(
                (item) => DictionaryMoedictDefinition(
                  def: item.def,
                ),
              )
              .toList(),
    );
  }

  Widget _getDictionaryTitle() {
    final List<Widget> children = [];
    children.add(Text(
      this.widget.ideograms,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: 30,
      ),
    ));

    if ((dictionaryList?.variants.length ?? 0) > 0) {
      String variantText = ' [';

      for (var variant in dictionaryList!.variants) {
        String variantWord = '';

        for (var i = 0; i < variant.length; i++) {
          if (this.widget.ideograms[i] == variant[i]) {
            variantWord += '-';
          } else {
            variantWord += variant[i];
          }
        }
        variantText += variantWord;
      }

      variantText += ']';

      children.add(Text(
        variantText,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 30,
        ),
      ));
    }

    children.add(Text(
      this.widget.pinyin,
      textAlign: TextAlign.start,
    ));

    return Row(
      children: children,
    );
  }

  Widget _getDictionaryDetails() {
    final List<Widget> children = [];

    // Adicionar classificadores
    // Adicionar se é separável

    if ((dictionaryList!.hsk ?? 0) < 999) {
      children.add(
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue[900],
          ),
          child: Text(
            "HSK ${dictionaryList!.hsk!.toString()}",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    if (dictionaryList!.pinziPt.length > 0) {
      children.add(DictionaryTitle("Português"));
      for (var item in dictionaryList!.pinziPt) {
        children.add(DictionaryDescription(
          item,
        ));
      }
    }

    if (dictionaryList!.chineseToolsPt.length > 0) {
      children.add(DictionaryTitle("Chinese Tools - Português"));
      for (var item in dictionaryList!.chineseToolsPt) {
        children.add(DictionaryDescription(
          item,
        ));
      }
    }

    if (dictionaryList!.glosbePt.length > 0) {
      children.add(DictionaryTitle("Glosbe - Português"));
      for (var item in dictionaryList!.glosbePt) {
        children.add(DictionaryDescription(
          item,
        ));
      }
    }

    if (dictionaryList!.chineseToolsEs.length > 0) {
      children.add(DictionaryTitle("Chinese Tools - Español"));
      for (var item in dictionaryList!.chineseToolsEs) {
        children.add(DictionaryDescription(
          item,
        ));
      }
    }

    if (dictionaryList!.glosbeEs.length > 0) {
      children.add(DictionaryTitle("Glosbe - Español"));
      for (var item in dictionaryList!.glosbeEs) {
        children.add(DictionaryDescription(
          item,
        ));
      }
    }

    if (dictionaryList!.pinziEs.length > 0) {
      children.add(DictionaryTitle("Español"));
      for (var item in dictionaryList!.pinziEs) {
        children.add(DictionaryDescription(
          item,
        ));
      }
    }

    if (dictionaryList!.unihan.length > 0) {
      children.add(DictionaryTitle("Unihan - English"));
      for (var item in dictionaryList!.unihan) {
        children.add(DictionaryDescription(
          item,
        ));
      }
    }

    if (dictionaryList!.cedict.length > 0) {
      children.add(DictionaryTitle("CC-CEDICT - English"));
      for (var item in dictionaryList!.cedict) {
        children.add(DictionaryDescription(
          item,
        ));
      }
    }

    if (dictionaryList!.chineseToolsEn.length > 0) {
      children.add(DictionaryTitle("Chinese Tools - English"));
      for (var item in dictionaryList!.chineseToolsEn) {
        children.add(DictionaryDescription(
          item,
        ));
      }
    }

    if (dictionaryList!.glosbeEn.length > 0) {
      children.add(DictionaryTitle("Glosbe - English"));
      for (var item in dictionaryList!.glosbeEn) {
        children.add(DictionaryDescription(
          item,
        ));
      }
    }

    if (dictionaryList!.pinziEn.length > 0) {
      children.add(DictionaryTitle("English"));
      for (var item in dictionaryList!.pinziEn) {
        children.add(DictionaryDescription(
          item,
        ));
      }
    }

    if (dictionaryMoedict != null) {
      children.add(DictionaryTitle("Moedict"));
      for (var item in dictionaryMoedict!.traditionalDefinitions) {
        for (var def in item.def) {
          children.add(DictionaryDescription(
            def,
          ));
        }
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
