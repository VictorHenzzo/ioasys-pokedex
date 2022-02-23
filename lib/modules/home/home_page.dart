import 'package:flutter/material.dart';
import 'package:pokedex_ioasys/infra/poke_api.dart';
import 'package:pokedex_ioasys/models/pokemon.dart';
import 'package:pokedex_ioasys/modules/shared/appBar/appbar_widget.dart';
import 'package:pokedex_ioasys/modules/shared/barraDeBusca/barra_de_busca.dart';
import 'package:pokedex_ioasys/modules/shared/gridPokemon/grid_builder_pokemon.dart';
import 'package:pokedex_ioasys/modules/shared/loading/loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pokemon> listaPokemons = [];
  List<Pokemon> filtroPokemons = [];
  bool loading = true;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _inicializaLista();
    });
    super.initState();
  }

  _inicializaLista() async {
    var results = await PokemonData().fetchAllPokemon();
    setState(() {
      listaPokemons = results;
      filtroPokemons = results;
      loading = false;
    });
  }

  callback(List<Pokemon> results) {
    setState(() {
      filtroPokemons = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBarWidget(),
          ),
          body: Column(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    BarraDeBusca(
                      listaPokemons: listaPokemons,
                      filtroPokemons: filtroPokemons,
                      callback: callback,
                    ),
                    Expanded(
                      child: loading == false
                          ? GridPokemon(pokemons: filtroPokemons)
                          : const Loading(),
                    ),
                  ],
                ),
              ),
            )
            //TODO: Inserir seta no final
          ])),
    );
  }
}
