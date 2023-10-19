import 'package:flutter/material.dart';
import 'package:teste_widgets_web_app/core/entities/user_entity.dart';
import 'package:teste_widgets_web_app/ui/widgets/grid_view_custom.dart';
import 'package:teste_widgets_web_app/ui/widgets/layout_body_custom.dart';

import '../utils/constants.dart';
import '../utils/name_mocks.dart';
import '../utils/text_style_utils.dart';
import '../widgets/item_list_data.dart';
import '../widgets/list_view_custom.dart';
import '../widgets/user_item_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final List<UserEntity> users;
  late final List<ItemListData> data;
  late bool isNotInit;

  @override
  void initState() {
    isNotInit = true;
    users = List.generate(
      names.length,
          (index) =>
          UserEntity(
            id: (index + 1),
            name: names[index],
            profile: (index + 1) == 1
                ? UserProfile.admin
                : (index + 1) % 2 == 0
                ? UserProfile.manager
                : UserProfile.sales,
          ),
    );
    data = users.map((e) => ItemListData(data: e, description: e.name)).toList();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      isNotInit = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Usuários', style: veryLargeW500Style),
        backgroundColor: Colors.blue,
      ),
      body: _body(),
    );
  }

  _body() {
    return LayoutBodyCustom(
      mobile: _mobile(),
      tablet: _tablet(),
      desktop: _desktop(),
      refresh: () => setState(() {}),
    );
  }

  _mobile() {
    return ListViewCustom(
      list: data,
      child: (index) {
        return _item(user: (data[index].data as UserEntity));
      },
    );
  }

  _tablet() {
    return GridViewCustom(
      list: data,
      crossAxisCount: 2,
      child: (value, index) {
        return _item(user: (value.data as UserEntity));
      },
    );
  }

  _desktop() {
    return GridViewCustom(
      list: data,
      crossAxisCount: 4,
      child: (value, index) {
        return _item(user: (value.data as UserEntity));
      },
    );
  }

  _item({required UserEntity user}) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(kSmallPadding),
        child: UserItemView(user: user),
      ),
    );
  }
}
