import 'package:flutter/material.dart';

class CounterListTile extends StatelessWidget {
  const CounterListTile({
    super.key,
    required this.title,
    required this.subTitle,
    this.onTapAdd,
    this.onTapRemove,
  });

  final String title, subTitle;
  final void Function()? onTapAdd;
  final void Function()? onTapRemove;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: onTapRemove, icon: const Icon(Icons.remove),),
          IconButton(onPressed: onTapAdd, icon: const Icon(Icons.add),),
        ],
      ),
    );
  }
}
