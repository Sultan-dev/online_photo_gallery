//This for Search Screen widget

import 'package:challengeday1/utilities/constants.dart';
import 'package:flutter/material.dart';

class MiddleSectionSearchScreen extends StatelessWidget {
  const MiddleSectionSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: kImagesListHorizontal.length,
                itemBuilder: (context, int index) {
                  return Container(
                    height: 200,
                    width: 330,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey[700]!.withOpacity(0.9),
                            Colors.grey[300]!.withOpacity(0.4),
                            Colors.grey[100]!.withOpacity(0.0),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.center,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        kImagesNames[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage(kImagesListHorizontal[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 15,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
