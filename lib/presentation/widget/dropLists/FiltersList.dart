import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FiltersList extends StatefulWidget {
  final ValueNotifier<Map<String, bool?>> filters;

  const FiltersList({Key? key, required this.filters}) : super(key: key);

  @override
  State<FiltersList> createState() => _FiltersListState();
}

class _FiltersListState extends State<FiltersList> {
  @override
  Widget build(BuildContext context) {
    var textColor = const Color.fromARGB(255, 134, 135, 137);
    var selectTextColor = const Color.fromARGB(255, 0, 158, 240);


    return Container(
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.only(top: 1, bottom: 1),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Wrap(
        children: widget.filters.value.keys.map(
              (key) {
            if (widget.filters.value[key] == null) {
              return Container(
                color: Colors.white,
                padding: const EdgeInsets.only(left: 34, top: 11, bottom: 11),
                width: double.infinity,
                child: Text(key, style: TextStyle(
                    color: textColor, fontWeight: FontWeight.w700)),
              );
            }

            return TextButton(
                style: TextButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 34, top: 11, bottom: 11),
                  backgroundColor: widget.filters.value[key]!
                      ? const Color.fromARGB(255, 241, 241, 241)
                      : Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    widget.filters.value[key] = !widget.filters.value[key]!;
                  });
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(key, style: TextStyle(
                          color: widget.filters.value[key]! ? selectTextColor
                              : textColor, fontWeight: FontWeight.w500)),
                      Padding(
                        padding: const EdgeInsets.only(right: 17),
                        child: widget.filters.value[key]!
                            ? SvgPicture.asset('images/checkMark.svg')
                            : null,
                      ),
                    ],
                  ),
                ));
          },
        ).toList(),
      ),
    );
  }
}
