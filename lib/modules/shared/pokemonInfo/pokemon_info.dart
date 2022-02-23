import 'package:flutter/material.dart';

class PokemonInfo extends StatelessWidget {
  PokemonInfo({
    Key? key,
    required this.icon,
    required this.value,
    required this.description,
  }) : super(key: key);
  final String icon;
  final String value;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 15, right: 10),
      child: Row(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Image(
                    image: AssetImage(icon),
                  ),
                  Text(
                    ' $value kg',
                    style: Theme.of(context).textTheme.headline5,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
