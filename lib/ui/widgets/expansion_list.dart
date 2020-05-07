import 'package:flutter/material.dart';

class ExpansionList<T> extends StatefulWidget {
  final List<T> items;
  final String title;
  final Function(T) onItemSelected;
  final bool smallVersion;
  ExpansionList({
    Key key,
    this.items,
    this.title,
    @required this.onItemSelected,
    this.smallVersion = false,
  }) : super(key: key);

  _ExpansionListState createState() => _ExpansionListState();
}

class _ExpansionListState extends State<ExpansionList> {
  final double startingHeight = 55;
  double expandedHeight;
  bool expanded = false;
  String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.title;
    _calculateExpandedHeight();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(0),
      child: AnimatedContainer(
        // padding: sharedStyles.fieldPadding,
        duration: const Duration(milliseconds: 180),
        height: expanded
            ? expandedHeight
            : widget.smallVersion ? 40 : startingHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: expanded
              ? [BoxShadow(blurRadius: 10, color: Colors.grey[300])]
              : null,
        ),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            ExpansionListItem(
              title: selectedValue,
              onTap: () {
                setState(() {
                  expanded = !expanded;
                });
              },
              showArrow: true,
              smallVersion: widget.smallVersion,
            ),
            Container(
              height: 2,
              color: Colors.grey[300],
            ),
            ..._getDropdownListItems()
          ],
        ),
      ),
    );
  }

  List<Widget> _getDropdownListItems() {
    return widget.items
        .map((item) => ExpansionListItem(
            smallVersion: widget.smallVersion,
            title: item.toString(),
            onTap: () {
              setState(() {
                expanded = !expanded;
                selectedValue = item.toString();
              });

              widget.onItemSelected(item);
            }))
        .toList();
  }

  void _calculateExpandedHeight() {
    expandedHeight = 2.0 +
        (widget.smallVersion ? 40 : 55) +
        (widget.items.length * (widget.smallVersion ? 40 : 55));
  }
}

class ExpansionListItem extends StatelessWidget {
  final Function onTap;
  final String title;
  final bool showArrow;
  final bool smallVersion;
  const ExpansionListItem({
    Key key,
    this.onTap,
    this.title,
    this.showArrow = false,
    this.smallVersion = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: smallVersion ? 40 : 55,
        alignment: Alignment.centerLeft,
        child: Row(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Text(
                title ?? '',
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontSize: smallVersion ? 14 : 17,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            showArrow
                ? Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 15,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
