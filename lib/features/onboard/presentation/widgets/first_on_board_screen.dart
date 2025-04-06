import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/services/prefs.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/core/utils/assets.dart';
import 'package:fruit_hub/features/auth/presentation/view/signin_view.dart';

class FirstOnBoardScreen extends StatelessWidget {
  const FirstOnBoardScreen({super.key});

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
                  child: SvgPicture.asset(Assets.imagesBasket1)),
              GestureDetector(
                onTap: () {
                  Prefs.setBool(kIsOnBoardViewSeen, true);
                  Navigator.pushReplacementNamed(context, SigninView.routeName);
                },
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text('تخط',
                        style: AppStyles.regular13.copyWith(
                          color: const Color(0xFF949D9E),
                        ))),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: 'مرحبًا بك في', style: AppStyles.bold23),
              TextSpan(
                  text: '  Fruit',
                  style: AppStyles.bold23.copyWith(
                    color: AppColors.primaryColor,
                  )),
              TextSpan(
                  text: 'HUB',
                  style: AppStyles.bold23.copyWith(
                    color: AppColors.secondaryColor,
                  )),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Text(
              textAlign: TextAlign.center,
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
              style: AppStyles.semiBold13.copyWith(
                color: const Color(0xff4E5556),
              )),
        ),
      ],
    );
  }
}
