//Gerado com o auxilio da seguinte ferramenta:
//https://javiercbk.github.io/json_to_dart/
import 'dart:convert';

class Pokemon {
  int? height;
  int? id;
  String? name;
  String? description;
  int? order;
  List<Stats>? stats;
  List<Types>? types;
  int? weight;
  String? sprite;

  Pokemon({
    this.height,
    this.id,
    this.name,
    this.order,
    this.stats,
    this.types,
    this.weight,
    this.description,
    this.sprite,
  });

  Pokemon.fromJson(final response) {
    var pokemon = json.decode(response.toString());

    height = pokemon['height'];
    id = pokemon['id'];
    name = pokemon['name'];
    order = pokemon['order'];
    if (pokemon['stats'] != null) {
      stats = <Stats>[];
      pokemon['stats'].forEach((v) {
        stats!.add(Stats.fromJson(v));
      });
    }
    if (pokemon['types'] != null) {
      types = <Types>[];
      pokemon['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
    weight = pokemon['weight'];
  }
}

class Stats {
  int? baseStat;
  Stat? stat;

  Stats({this.baseStat, this.stat});

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    stat = json['stat'] != null ? Stat.fromJson(json['stat']) : null;
  }
}

class Stat {
  String? name;
  String? url;

  Stat({this.name, this.url});

  Stat.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}

class Types {
  int? slot;
  Stat? type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null ? Stat.fromJson(json['type']) : null;
  }
}

// Sprites:
// "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg