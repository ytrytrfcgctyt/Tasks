import 'package:taskes/constant/app/appcoloros.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Butonsvgtext extends StatelessWidget {
  final String title;
  final String svgasset;
  final void Function() onTap;
  const Butonsvgtext({
    super.key,
    required this.title,
    required this.svgasset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          width: 100,
          height: 60,
          decoration: BoxDecoration(
            color: Appcoloros.bakgroundDark2,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.orange,
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child:
                    // Text('data'),
                    Row(
                      children: [
                        Expanded(
                          child: SvgPicture.asset(
                            svgasset,
                            // ignore: deprecated_member_use
                            color: Appcoloros.textDark,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 17,
                              color: Appcoloros.textDark,
                            ),
                          ),
                        ),
                      ],
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
