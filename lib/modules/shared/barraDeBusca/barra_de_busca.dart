import 'package:flutter/material.dart';
import 'package:pokedex_ioasys/models/pokemon.dart';

class BarraDeBusca extends StatelessWidget {
  const BarraDeBusca(
      {Key? key,
      required this.listaPokemons,
      required this.filtroPokemons,
      required this.callback})
      : super(key: key);
  final List<Pokemon> listaPokemons;
  final List<Pokemon> filtroPokemons;
  final Function callback;

  void filtrar(String enteredKeyword) {
    List<Pokemon> results;
    if (enteredKeyword.isEmpty) {
      results = listaPokemons;
    } else {
      results = listaPokemons
          .where((user) =>
              user.name!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    callback(results);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 50, top: 50, bottom: 40),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) => filtrar(value),
              style: Theme.of(context).textTheme.headline4,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                hintText: "Buscar pokémon",
                labelText: "Buscar",
                hintStyle: Theme.of(context).textTheme.headline4,
                labelStyle: Theme.of(context).textTheme.headline3,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.only(top: 5, left: 46),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
          //TODO: Animação para filtro ao clicar no coração
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Icon(
              Icons.favorite_border,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
