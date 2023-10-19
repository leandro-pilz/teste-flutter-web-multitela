import 'package:flutter/material.dart';

import 'item_list_data.dart';

class GridViewCustom extends StatefulWidget {
  final List<ItemListData> list;
  final Widget Function(ItemListData, int index) child;
  final int crossAxisCount;

  const GridViewCustom({super.key, required this.list, required this.child, required this.crossAxisCount});

  @override
  State<GridViewCustom> createState() => _GridViewCustomState();
}

class _GridViewCustomState extends State<GridViewCustom> {
  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      itemCount: widget.list.length,
      itemBuilder: (BuildContext context, int index) {
        return widget.child(widget.list[index], index);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        childAspectRatio: MediaQuery.sizeOf(context).height / 420,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
    );
  }
}
