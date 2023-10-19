import 'package:flutter/material.dart';

import '/ui/utils/constants.dart';
import '/ui/utils/messages.dart';
import '/ui/utils/text_style_utils.dart';
import 'circular_progress_indicator_custom.dart';
import 'item_list_data.dart';

class ListViewCustom extends StatefulWidget {
  final List<ItemListData> list;
  final Widget Function(int index) child;
  final bool? shrinkWrap, isProgress, enableBorder;
  final String? textNotFoundData;

  const ListViewCustom({
    super.key,
    required this.list,
    required this.child,
    this.shrinkWrap,
    this.isProgress,
    this.enableBorder,
    this.textNotFoundData,
  });

  @override
  State<ListViewCustom> createState() => _ListViewCustomState();
}

class _ListViewCustomState extends State<ListViewCustom> {
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
    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      child: Stack(
        children: [
          Container(
            decoration: (widget.enableBorder ?? false)
                ? BoxDecoration(
                    border: Border.all(
                      color: Colors.black87,
                      style: BorderStyle.solid,
                      // width: 1.0,
                    ),
                  )
                : null,
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: kHeightBottomListView),
              controller: scrollController,
              shrinkWrap: widget.shrinkWrap ?? false,
              itemCount: widget.list.length,
              itemBuilder: (_, index) => widget.child(index),
            ),
          ),
          if (widget.list.isEmpty && !(widget.isProgress ?? false))
            Center(
              child: Text(
                widget.textNotFoundData ?? noDataFound,
                style: largeW500Style,
              ),
            ),
          if (widget.list.isNotEmpty && (widget.isProgress ?? false))
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: kLargeMargin),
              child: const CircularProgressIndicatorCustom(),
            ),
        ],
      ),
    );
  }
}
