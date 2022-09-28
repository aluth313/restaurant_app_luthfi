import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/widget/custom_button.dart';
import 'package:restaurant_app/widget/textfield.dart';

class ReviewPage extends StatefulWidget {
  static const routeName = '/review';

  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final nameController = TextEditingController();
  final reviewController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    reviewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _header() {
      return SafeArea(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 20,
                left: 24,
                right: 24,
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://restaurant-api.dicoding.dev/images/small/14',
                    ),
                    radius: MediaQuery.of(context).size.width / 4,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'The Glam Room',
                    style: customStyleText.copyWith(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Washington St, Bradford BD8 9QW',
                    style: customStyleText.copyWith(
                      // fontSize: 20,
                      color: secondaryColor,
                      // fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_outlined,
                        size: 23,
                        color: yellowColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '4.5',
                        style: customStyleText.copyWith(
                          fontSize: 23,
                          // color: secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 24),
              child: CircleAvatar(
                backgroundColor: greyColor,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: defaultTargetPlatform == TargetPlatform.android
                        ? Icon(
                            Icons.arrow_back,
                            color: blackColor,
                          )
                        : Icon(
                            Icons.arrow_back_ios_outlined,
                            color: blackColor,
                          )),
              ),
            ),
          ],
        ),
      );
    }

    Widget _review() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          left: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: customStyleText.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            TextFieldCustom(
              hintText: 'Name...',
              controller: nameController,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Your Review',
              style: customStyleText.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              cursorColor: blackColor,
              maxLength: 1000,
              maxLines: 8,
              controller: reviewController,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'Review...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: blackColor),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget _submitButton() {
      return Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 24,
          right: 24,
          bottom: 30,
        ),
        child: CustomButton(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          text: 'Submit',
          onTap: () {
            final restoProv = Provider.of<RestaurantProvider>(context, listen: false);
            restoProv.review('s1knt6za9kkfw1e867', nameController.text, reviewController.text).then((response) {
              // if (response == ) {
                
              // }
            });
          },
        ),
      );
    }

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _header(),
          _review(),
          _submitButton(),
        ],
      ),
    );
  }
}
