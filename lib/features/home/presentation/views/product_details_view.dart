import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_app/core/extension/text_theme_extension.dart';
import 'package:shoes_app/core/utils/app_colors.dart';
import 'package:shoes_app/core/utils/app_images.dart';
import 'package:shoes_app/core/widgets/custom_button.dart';
import 'package:shoes_app/core/widgets/custom_text_button.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Man\'s Shoes', maxLines: 1),
        leadingWidth: 100,
        leading: Row(
          children: [
            const SizedBox(width: 10),
            InkWell(
              onTap: () {},
              child: CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.white,
                child:
                    Image.asset(ImagesPaths.locationIconPng, fit: BoxFit.fill),
              ),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.white,
              child: Image.asset(ImagesPaths.locationIconPng, fit: BoxFit.fill),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitMode()
              : _buildLandscapeMode();
        },
      ),
    );
  }

  Widget _buildPortraitMode() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            const ProductTopImage(),
            SizedBox(height: 12.h),
            const BestSellButton(),
            const ProductItemNameAndDescription(),
            const ProductsGallery(),
            const ProductSize(),
            const AddToCart(),
          ],
        ),
      ),
    );
  }

  Widget _buildLandscapeMode() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                const ProductTopImage(),
                SizedBox(height: 12.h),
                const BestSellButton(),
                const ProductItemNameAndDescription(),
              ],
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductsGallery(),
                ProductSize(),
                AddToCart(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//       body: _productDetailsBody(),
//     );
//   }

//   Widget _productDetailsBody() {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsetsDirectional.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 12.h),
//             const ProductTopImage(),
//             SizedBox(height: 12.h),
//             const BestSellButton(),
//             const ProductItemNameAndDescription(),
//             const ProductsGallery(),
//             const ProductSize(),
//             const AddToCart()
//           ],
//         ),
//       ),
//     );
//   }
// }

class BestSellButton extends StatelessWidget {
  const BestSellButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onTap: () {},
      text: 'Best Sell',
      style: context.f15700?.copyWith(color: AppColors.primaryColor),
    );
  }
}

class AddToCart extends StatelessWidget {
  const AddToCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Price',
                    style:
                        context.f20500?.copyWith(color: AppColors.lightGrey)),
                const SizedBox(height: 6),
                Text('\$220', style: context.f20700),
              ],
            ),
          ),
          const Spacer(flex: 1),
          Expanded(
            flex: 4,
            child: CustomButton(
              function: () {},
              title: 'Add To Cart',
              textStyle: context.f20700?.copyWith(color: AppColors.white),
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductSize extends StatefulWidget {
  const ProductSize({
    super.key,
  });

  @override
  State<ProductSize> createState() => _ProductSizeState();
}

class _ProductSizeState extends State<ProductSize> {
  int currentIndex = 0;
  int indexS = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Size', style: context.f21700),
            SizedBox(
              height: 30,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 5),
                  itemBuilder: (context, index) => InkWell(
                        onTap: () => setState(() {
                          indexS = index;
                        }),
                        child: Text('EU',
                            style: indexS == index
                                ? context.f20700
                                : context.f20700
                                    ?.copyWith(color: AppColors.lightGrey)),
                      ),
                  itemCount: 3),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 80,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(width: 5),
              itemBuilder: (context, index) => InkWell(
                    onTap: () => setState(() {
                      currentIndex = index;
                    }),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: currentIndex == index
                          ? AppColors.primaryColor
                          : AppColors.white,
                      child: Text('20', style: context.f20700),
                    ),
                  ),
              itemCount: 10),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}

class ProductsGallery extends StatelessWidget {
  const ProductsGallery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gallery', style: context.f22600),
        SizedBox(height: 12.h),
        Row(
          children: List.generate(
              3,
              (index) => Image.asset(ImagesPaths.shoes1Png,
                  width: 100.w, height: 80.h, fit: BoxFit.fill)),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}

class ProductItemNameAndDescription extends StatelessWidget {
  const ProductItemNameAndDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12.h),
        Text('Nike Shoes',
            style: context.f28800,
            overflow: TextOverflow.ellipsis,
            maxLines: 1),
        SizedBox(height: 12.h),
        Text('130\$', style: context.f21700),
        SizedBox(height: 12.h),
        Text(
            'Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike....',
            style: context.f18600?.copyWith(color: AppColors.lightGrey)),
        SizedBox(height: 16.h),
      ],
    );
  }
}

class ProductTopImage extends StatelessWidget {
  const ProductTopImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            top: -20,
            child: Image.asset(ImagesPaths.shoes3Png,
                width: ScreenUtil().screenWidth * .8, fit: BoxFit.fill),
          ),
          Positioned(
            bottom: -10,
            child: Image.asset(ImagesPaths.shoesBackPng,
                width: ScreenUtil().screenWidth * .95, fit: BoxFit.fill),
          ),
        ],
      ),
    );
  }
}
