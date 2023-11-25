import 'package:minip/core/utils/size_utils.dart';
import 'package:minip/theme/app_decoration.dart';

import '../favorites_food_page/widgets/favoritesfood_item_widget.dart';
import 'package:allergycom/core/app_export.dart';
import 'package:allergycom/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class FavoritesFoodPage extends StatefulWidget {
  const FavoritesFoodPage({Key? key})
      : super(
          key: key,
        );

  @override
  FavoritesFoodPageState createState() => FavoritesFoodPageState();
}

class FavoritesFoodPageState extends State<FavoritesFoodPage>
    with AutomaticKeepAliveClientMixin<FavoritesFoodPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: Column(
            children: [
              SizedBox(height: 24.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.h),
                child: Column(
                  children: [
                    _buildFavoritesFood(context),
                    SizedBox(height: 342.v),
                    _buildEightySeven(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFavoritesFood(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 4.h,
        right: 5.h,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 97.v,
          crossAxisCount: 3,
          mainAxisSpacing: 16.h,
          crossAxisSpacing: 16.h,
        ),
        physics: BouncingScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return FavoritesfoodItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildEightySeven(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgHome,
          height: 32.adaptSize,
          width: 32.adaptSize,
          margin: EdgeInsets.symmetric(vertical: 8.v),
        ),
        Spacer(
          flex: 28,
        ),
        CustomImageView(
          imagePath: ImageConstant.imgSearch,
          height: 32.adaptSize,
          width: 32.adaptSize,
          margin: EdgeInsets.symmetric(vertical: 8.v),
        ),
        Spacer(
          flex: 21,
        ),
        CustomIconButton(
          height: 48.adaptSize,
          width: 48.adaptSize,
          padding: EdgeInsets.all(12.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgCamera,
          ),
        ),
        Spacer(
          flex: 23,
        ),
        CustomImageView(
          imagePath: ImageConstant.imgIconlyBoldHeart,
          height: 32.adaptSize,
          width: 32.adaptSize,
          margin: EdgeInsets.symmetric(vertical: 8.v),
        ),
        Spacer(
          flex: 26,
        ),
        CustomImageView(
          imagePath: ImageConstant.imgUser,
          height: 32.adaptSize,
          width: 32.adaptSize,
          margin: EdgeInsets.symmetric(vertical: 8.v),
        ),
      ],
    );
  }
}
