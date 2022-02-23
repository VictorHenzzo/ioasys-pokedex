import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 17,
          width: MediaQuery.of(context).size.height,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 13),
                child: Image.asset('assets/logoPrimaryColor.png'),
              ),
              Text('ioasys pokédex',
                  style: Theme.of(context).textTheme.headline2),
            ],
          ),
        ),
      ],
    );
  }
}
