import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyState();
}

class MyState extends State {
  List<ItemEntity> entityList = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 30; i++) {
      entityList.add(ItemEntity("Item  $i", Icons.accessibility));
    }

    Future<void> _handleRefresh() async {
      print('-------开始刷新------------');
      await Future.delayed(Duration(seconds: 2), () {
        //模拟延时
        setState(() {
          entityList.clear();
          entityList = List.generate(
              10,
              (index) =>
                  new ItemEntity("下拉刷新后--item $index", Icons.accessibility));
          return null;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("ListView"),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ItemView(entityList[index]);
          },
          itemCount: entityList.length,
        ));
  }
}

/**
 * 渲染Item的实体类
 */
class ItemEntity {
  String title;
  IconData iconData;

  ItemEntity(this.title, this.iconData);
}

/**
 * ListView builder生成的Item布局，读者可类比成原生Android的Adapter的角色
 */
class ItemView extends StatelessWidget {
  ItemEntity itemEntity;

  ItemView(this.itemEntity);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        ListTile(
            leading: Icon(itemEntity.iconData),
            title: Text(itemEntity.title),
            subtitle: Text('长列表')),
        SizedBox(
          height: 0.2,
          child: Container(
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
