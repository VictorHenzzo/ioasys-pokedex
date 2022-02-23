import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pokedex_ioasys/models/pokemon.dart';
import 'package:pokedex_ioasys/modules/pokemonPage/pokemon_page.dart';
import 'package:pokedex_ioasys/dependencies/capitalize.dart';

class PokemonCardWidget extends StatelessWidget {
  PokemonCardWidget(
      {Key? key, required this.pokemon, required this.pokemonColor})
      : super(key: key);

  final Pokemon pokemon;
  final Color? pokemonColor;
  final NumberFormat formatter = NumberFormat("000");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          PokemonPage.routeName,
          arguments: pokemon,
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: pokemonColor!)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(children: [
            Positioned(
              right: 5,
              child: Text(
                '#${formatter.format(pokemon.id)}',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                  color: pokemonColor,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SvgPicture.network(
                    pokemon.sprite!,
                    height: 72,
                    width: 72,
                  ),
                ),
                Expanded(
                    child: Container(
                  color: pokemonColor,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      pokemon.name!.capitalize(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                )),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
