import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:pinzi/models/file.dart';
import 'package:pinzi/routes.dart';
import 'package:pinzi/widgets/custom_typography.dart';

class MenuItem {
  String code;
  String description;
  IconData icon;
  String? extraLabel;
  bool divider;

  MenuItem({
    required this.code,
    required this.description,
    required this.icon,
    this.extraLabel,
    this.divider = false,
  });
}

class FileTile extends StatelessWidget {
  final File file;

  FileTile({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      padding: EdgeInsets.symmetric(vertical: 0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: Icon(
            file.type == 'folder' ? Icons.folder : Icons.note,
          ),
        ),
        title: CustomTypography(
          textAlign: TextAlign.start,
          text: file.title!,
          fontWeight: FontWeight.bold,
        ),
        trailing: Container(
          child: PopupMenuButton<String>(
            itemBuilder: (context) => this.getMenuItems(context),
            child: Icon(Icons.more_vert),
            onSelected: (String selected) {
              this.menuAction(context, selected);
            },
          ),
        ),
      ),
    );
  }

  List<PopupMenuEntry<String>> getMenuItems(
    BuildContext context,
  ) {
    final items = [
      MenuItem(
        code: "view",
        description: 'Visualizar',
        icon: Icons.visibility,
      ),
      MenuItem(
        code: "delete",
        description: 'Apagar',
        icon: Icons.delete,
        divider: true,
      ),
    ];

    return items
        .map<Iterable<PopupMenuEntry<String>>>(
          (item) => [
            ...item.divider ? [PopupMenuDivider()] : [],
            PopupMenuItem<String>(
              value: item.code,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Icon(item.icon),
                          SizedBox(width: 10),
                          CustomTypography(
                            text: item.description,
                            // color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: item.extraLabel != null ? 10 : 0,
                          ),
                        ],
                      ),
                    ),
                    CustomTypography(
                      text: item.extraLabel ?? "",
                      fontSize: 11,
                    ),
                  ],
                ),
              ),
            )
          ],
        )
        .expand((e) => e)
        .toList();
  }

  Future<void> menuAction(BuildContext context, String? code) async {
    switch (code) {
      case "delete":
        // showModalBottomSheet<void>(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(16.0),
        //   ),
        //   context: context,
        //   isScrollControlled: true,
        //   backgroundColor: Colors.white,
        //   builder: (BuildContext context) {
        //     return Container(
        //       height: MediaQuery.of(context).size.height * 0.93,
        //       child: PrivacyPolicyModal(),
        //     );
        //   },
        // );
        break;
      case "view":
        router.navigateTo(
          context,
          "/file",
          transition: TransitionType.inFromRight,
        );

        break;

      default:
    }
  }
}
