import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/core/utils/assets.dart';

class SecondOnBoardScreen extends StatelessWidget {
  const SecondOnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.50,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  Assets.imagesPageViewBackgroundImage,
                  fit: BoxFit.fill,
                  colorFilter: const ColorFilter.mode(
                      Color(0xffFDF4E2), BlendMode.srcIn),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: SvgPicture.asset(Assets.imagesBasket2)),
            ],
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        const Text('ابحث وتسوق',
            textAlign: TextAlign.center, style: AppStyles.bold23),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Text(
              textAlign: TextAlign.center,
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
              style: AppStyles.semiBold13.copyWith(
                color: const Color(0xff4E5556),
              )),
        ),
      ],
    );
  }
}
