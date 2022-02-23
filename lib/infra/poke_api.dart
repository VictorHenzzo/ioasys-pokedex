import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:pokedex_ioasys/models/pokemon.dart';
import 'dart:convert';

//TODO: Incluir tratamento de erros
class PokemonData {
  final NumberFormat formatter = NumberFormat("000");

  fetchPokemonData(int pokemonNumber) async {
    var dio = Dio();
    var response =
        await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonNumber');
    final pokemonInstance = Pokemon.fromJson(response);

    //As descrições dos pokemons (chamadas "flavor_texts) estão em outro endpoint
    response = await dio
        .get('https://pokeapi.co/api/v2/pokemon-species/$pokemonNumber');
    var pokemon = json.decode(response.toString());
    final description = pokemon['flavor_text_entries'][0]['flavor_text'];

    pokemonInstance.description = description;
    pokemonInstance.sprite =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/$pokemonNumber.svg";

    return pokemonInstance;
  }

  Future fetchAllPokemon() async {
    List<Pokemon> listaPokemons = [];

    for (int i = 1; i <= 151; i++) {
      listaPokemons.add(await fetchPokemonData(i));
    }

    return listaPokemons;
  }
}
