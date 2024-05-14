import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:laweather/screens/home/home_screen.dart';
import 'package:laweather/widgets/global/bloc/custom_bottom_navigation_bloc.dart';


class CustomBottomNavigationWidget extends StatefulWidget {
  const CustomBottomNavigationWidget({super.key});

  @override
  State<CustomBottomNavigationWidget> createState() =>
      _CustomBottomNavigationWidgetState();
}

class _CustomBottomNavigationWidgetState
    extends State<CustomBottomNavigationWidget> {
  int _page = 1;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  Widget _getPage(int page) {
    switch (page) {
      case 0:
        return const SizedBox.shrink();
      case 1:
        return const HomeScreen();
      case 2:
        return const SizedBox.shrink();
      default:
        return const SizedBox.shrink();
    }
  }

  bool isActive(int index) {
    return _page == index;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomBottomNavigationBloc,
        CustomBottomNavigationState>(
      listener: (context, state) {
        if (state is CustomBottomNavigationChangeState) {
          setState(() {
            _page = state.newIndex;
          });
        }
      },
      child: Scaffold(
        body: _getPage(_page),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _page,
          height: 66,
          items: <Widget>[
            Icon(
              Icons.location_on_outlined,
              size: 30,
              color: isActive(0)
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.outline,
            ),
            Icon(
              Icons.cloud_sharp,
              size: 30,
              color: isActive(1)
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.outline,
            ),
            Icon(
              Icons.list_outlined,
              size: 30,
              color: isActive(2)
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.outline,
            ),
          ],
          color: Theme.of(context).colorScheme.surfaceVariant,
          buttonBackgroundColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.background,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            BlocProvider.of<CustomBottomNavigationBloc>(
              context,
            ).add(
              CustomBottomNavigationChangeEvent(
                index,
              ),
            );
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}
