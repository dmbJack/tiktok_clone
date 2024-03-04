import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavBar extends StatelessWidget {
  final int? pageIndex;
  const CustomNavBar({super.key, this.pageIndex});
  @override
  Widget build(BuildContext context) {
    //L'index de la page reçu en paramètre permettra de changer la couleur de l'icon dans notre cas 
    //pour que l'utilisateur sache sur quel icon il a cliqué
    int selectedIndex = pageIndex ?? 0;
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              //Renvoie la page feed designé dans notre router
              context.goNamed('feed');
            },
            icon: Icon(
              Icons.home,
              color: selectedIndex == 0 ? Colors.black : Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {
              //Renvoie la page discover designé dans notre router
              context.goNamed('discover');
            },
            icon: Icon(
              Icons.search,
              color: selectedIndex == 1 ? Colors.black : Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_circle,
              color: selectedIndex == 2 ? Colors.black : Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {
              //Renvoie la page chat designé dans notre router
              context.goNamed('chat');
            },
            icon: Icon(Icons.message,
                color: selectedIndex == 3 ? Colors.black : Colors.grey),
          )
        ],
      ),
    );
  }
}
