import 'package:app_category/api/CategoryAPI.dart';
import 'package:app_category/api/SubCategoryAPI.dart';
import 'package:app_category/model/CategoryModel.dart';
import 'package:app_category/model/SubCategoryModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SubCategoryScreen extends StatelessWidget {
  int id;
  SubCategoryScreen({this.id});

  @override
  Widget build(BuildContext context) {
    return SubCategories(id: id,);
  }
}

class SubCategories extends StatefulWidget {
  int id;
  SubCategories({this.id});
  @override
  _SubCategoriesState createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategories> {

  SubCategoryModel model;
  bool isLoaded = false;

  getSubCategories() async {
    print('get called');
    SubCategoryAPI api =SubCategoryAPI();
    model = await api.getSubCateory(categoryId: widget.id);

    if(this.mounted){
      setState(() {
        isLoaded = true;
      });
    }
  }

  Widget circleAvatar(){
    return CircleAvatar(
      backgroundColor:Colors.grey,
      radius: 23,
      child: Container(
        alignment: Alignment.bottomRight,
        child: CircleAvatar(
          backgroundColor: Colors.green,
          radius: 6,
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSubCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                color: Colors.grey,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.65,
                color: Colors.blue,
              ),
            ],
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Icon(Icons.arrow_back,color: Colors.white,size: 25,),
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                        )
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          "Search Result",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.search),
                        Text(' Category, Question'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  margin: EdgeInsets.all(15),
                  child: isLoaded
                      ? Container(
                    height: MediaQuery.of(context).size.height*0.7,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[100],
                    ),
                    child: Column(
                      children: [
                        GridView.builder(
                          itemCount: model.data ==null ? 0 :model.data.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                          itemBuilder: (context,index){
                            return GestureDetector(
                              child: Container(
                                margin: EdgeInsets.all(5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height : 40,
                                        child: Image.network(model.data[index].image,fit: BoxFit.fitHeight,),
                                      ),
                                      Container(
                                        child: Text(
                                          model.data[index].name,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.blue
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: (){

                              },
                            );
                          },
                        ),
                        SizedBox(height: 15,),
                        Container(
                          margin: EdgeInsets.all(1),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              circleAvatar(),
                              circleAvatar(),
                              circleAvatar(),
                              circleAvatar(),
                              circleAvatar(),
                              circleAvatar(),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey,
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Dr. Jobas Kign',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text('Dental Specialist',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.blue
                                      ),
                                    ),
                                    Text('12:00 pm - 3:00 pm'),
                                    RatingBar.builder(
                                      itemCount: 5,
                                      itemSize: 20,
                                      unratedColor: Colors.yellow[800],
                                      itemBuilder: (context,index){
                                        return Icon(Icons.star);
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey,
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Dr. Jobas Kign',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text('Dental Specialist',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.blue
                                      ),
                                    ),
                                    Text('12:00 pm - 3:00 pm'),
                                    RatingBar.builder(
                                      itemCount: 5,
                                      itemSize: 20,
                                      unratedColor: Colors.yellow[800],
                                      itemBuilder: (context,index){
                                        return Icon(Icons.star);
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey,
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Dr. Jobas Kign',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text('Dental Specialist',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.blue
                                      ),
                                    ),
                                    Text('12:00 pm - 3:00 pm'),
                                    RatingBar.builder(
                                      itemCount: 5,
                                      itemSize: 20,
                                      unratedColor: Colors.yellow[800],
                                      itemBuilder: (context,index){
                                        return Icon(Icons.star);
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ) : Text('loading'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

