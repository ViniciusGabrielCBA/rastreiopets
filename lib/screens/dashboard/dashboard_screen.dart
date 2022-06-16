import "package:flutter/material.dart";
import 'package:rastreiopets/screens/dashboard/items_dashboard.dart';

// ignore: must_be_immutable
class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({Key? key}) : super(key: key);
  ItemsDashboard item1 = ItemsDashboard(
    "Adicionar Pet",
    "assets/images/adicionarpets.png",
  );
  ItemsDashboard item2 = ItemsDashboard(
    "Remover Pet",
    "assets/images/deletarpets.png",
  );

  ItemsDashboard item3 = ItemsDashboard(
    "Logout",
    "assets/images/logout.png",
  );

  @override
  Widget build(BuildContext context) {
    List<ItemsDashboard> myList = [item1, item2, item3];
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      // ignore: avoid_unnecessary_containers
      child: Center(
        child: GridView.builder(
            itemCount: myList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, childAspectRatio: 1, mainAxisSpacing: 8, crossAxisSpacing: 8),
            itemBuilder: (BuildContext ctx, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                child: GestureDetector(
                  onTap: () => callOwner(ctx, index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SingleChildScrollView(
                      reverse: true,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Image.asset(myList[index].image),
                            Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: Text(myList[index].title),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  callOwner(BuildContext context, int index) {
    if (index == 0) {
      Navigator.of(context).pushNamed("/addPets");
    } else if (index == 1) {
      Navigator.of(context).pushNamed("/removePets");
    } else if (index == 2) {
      Navigator.of(context).pushReplacementNamed("/login");
    }
  }
}
