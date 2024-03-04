import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavBar extends StatefulWidget {
  final int? pageIndex;
  const CustomNavBar({super.key, this.pageIndex});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _selectedIndex = widget.pageIndex ?? 0;
    // return BlocBuilder<NavigationCubit, NavigationState>(
    //   builder: (context, state) {
    //     return BottomNavigationBar(

    //       backgroundColor: Colors.black,
    //       currentIndex: state.index,
    //       onTap: (index) {
    //         context.read<NavigationCubit>().navigate(index);
    //         switch (index) {
    //           case 0:
    //             context.goNamed('feed');
    //             break;
    //           case 1:
    //             context.goNamed('discover');
    //             break;
    //           case 2:
    //             context.goNamed('add');
    //             break;
    //           case 3:
    //             context.goNamed('chat');
    //             break;
    //           default:
    //         }
    //       },
    //       items: const [
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.home),
    //           label: 'Home',
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.search),
    //           label: 'Search',
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.add_circle),
    //           label: 'Add',
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.message),
    //           label: 'Chat',
    //         ),
    //       ],
    //     );
    //   },
    // );

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              // context.read<NavigationCubit>().navigate(0);
              // setState(() {
              //   _selectedIndex = 0;
              // });

              context.goNamed('feed');
            },
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? Colors.black : Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {
              // setState(() {
              //   _selectedIndex = 1;
              // });
              // context.read<NavigationCubit>().navigate(1);
              context.goNamed('discover');
            },
            icon: Icon(
              Icons.search,
              color: _selectedIndex == 1 ? Colors.black : Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {
              // setState(() {
              //   _selectedIndex = 2;
              // });
              // context.read<NavigationCubit>().navigate(2);
              // context.goNamed('add');
            },
            icon: Icon(
              Icons.add_circle,
              color: _selectedIndex == 2 ? Colors.black : Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {
              // setState(() {
              //   _selectedIndex = 3;
              // });
              // context.read<NavigationCubit>().navigate(3);
              // context.goNamed('chat');
            },
            icon: Icon(Icons.message,
                color: _selectedIndex == 3 ? Colors.black : Colors.grey),
          )
        ],
      ),
    );
  }
}
