import 'package:flutter/material.dart';
import 'package:pokedex_ioasys/models/pokemon.dart';
import 'package:pokedex_ioasys/modules/shared/pokemonCard/pokemon_card_widget.dart';
import 'package:pokedex_ioasys/modules/shared/typesPalette/types_color_palette.dart';

class GridPokemon extends StatelessWidget {
  const GridPokemon({Key? key, required this.pokemons}) : super(key: key);
  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          return PokemonCardWidget(
            pokemon: pokemons[index],
            pokemonColor: TypesColorPalette
                .palette[pokemons[index].types![0].type!.name!],
          );
        });
  }
}
