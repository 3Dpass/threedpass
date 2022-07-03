import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/home_page/presentation/widgets/get_object_card.dart';
import 'package:threedpass/features/home_page/presentation/widgets/objects_list.dart';
import 'package:threedpass/features/home_page/presentation/widgets/open_explorer_card.dart';
import 'package:threedpass/router/router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 16,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("3DPass  "),
            Text(
              "recognize your objects",
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: const [
          GetObjectCard(),
          SizedBox(height: 4),
          OpenExplorerCard(),
          SizedBox(height: 4),
          Flexible(
            child: ObjectsList(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const IconButton(
              icon: Icon(Icons.info, color: Colors.grey),
              onPressed: null,
              //title: Container(), //Text("Add"),
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.grey),
              onPressed: () {
                context.router.push(const SettingsRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
