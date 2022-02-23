import 'package:flutter/material.dart';
import 'package:pokedex_ioasys/dependencies/capitalize.dart';
import 'package:pokedex_ioasys/models/pokemon.dart';
import 'package:pokedex_ioasys/modules/shared/typesPalette/types_color_palette.dart';

class TypesListBuilder extends StatelessWidget {
  const TypesListBuilder({Key? key, required this.types}) : super(key: key);
  final List<Types> types;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: types.length,
            itemBuilder: (context, index) {
              return Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: TypesColorPalette
                            .palette[types[index].type!.name!]),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        types[index].type!.name!.capitalize(),
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
