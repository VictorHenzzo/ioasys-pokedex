import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:pokedex_ioasys/models/pokemon.dart';
import 'package:pokedex_ioasys/modules/shared/pokemonInfo/pokemon_info.dart';
import 'package:pokedex_ioasys/modules/shared/typesListBuilder/types_list_builder.dart';
import 'package:pokedex_ioasys/dependencies/capitalize.dart';
import 'package:pokedex_ioasys/modules/shared/typesPalette/types_color_palette.dart';

class PokemonPage extends StatelessWidget {
  PokemonPage({Key? key}) : super(key: key);

  static const routeName = 'pokemonPage';
  final NumberFormat formatter = NumberFormat("000");

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor:
            TypesColorPalette.palette[pokemon.types![0].type!.name!],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            pokemon.name!.capitalize(),
            style: Theme.of(context).textTheme.headline1,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: 30,
                top: 22,
              ),
              child: Text('#${formatter.format(pokemon.id)}'),
            )
          ],
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 7.0,
                right: 7.0,
                top: 200,
              ),
              child: Container(
                  height: height * 0.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.only(top: 70, left: 15),
                                child: TypesListBuilder(types: pokemon.types!)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        width: double.infinity,
                        child: Row(
                          children: [
                            PokemonInfo(
                                icon: 'assets/Scale.png',
                                value: pokemon.weight.toString(),
                                description: 'Weigth'),
                            PokemonInfo(
                                icon: 'assets/Ruller.png',
                                value: pokemon.height.toString(),
                                description: 'Height')
                          ],
                        ),
                      ),
                      //TODO: Corrigir fetchAllPokemon
                      //Replace all foi adotado porque por algum motivo a api mandava quebras de linha
                      Text(
                        pokemon.description!.replaceAll("\n", ""),
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.center,
                      )
                    ],
                  )),
            ),
            const Positioned(
              top: 5,
              right: 42,
              child: Image(
                image: AssetImage('assets/Pokeball.png'),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 90),
                child: SvgPicture.network(
                  pokemon.sprite!,
                  height: 150,
                  width: 150,
                ),
              ),
            ),
          ],
        ));
  }
}
