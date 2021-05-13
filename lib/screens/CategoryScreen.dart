import 'package:app_category/api/CategoryAPI.dart';
import 'package:app_category/api/SubCategoryAPI.dart';
import 'package:app_category/model/CategoryModel.dart';
import 'package:app_category/model/SubCategoryModel.dart';
import 'package:app_category/screens/SubCategoryScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Categories();
  }
}

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  CategoryModel model;
  SubCategoryModel mdl;
  bool isLoaded = false;

  getCategories() async {
    print('get called');
    CategoryAPI api = CategoryAPI();
    model = await api.getCateory();
    if(this.mounted){
      setState(() {
        isLoaded = true;
      });
    }

    // SubCategoryAPI api =SubCategoryAPI();
    // mdl = await api.getSubCateory(categoryId: 1);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategories();
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
                        child: Icon(Icons.wrap_text,color: Colors.white,size: 25,),
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          "Let's Find Your Advisor",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.notifications_none,color: Colors.white,size: 25,),
                        ),
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
                              crossAxisCount: 4),
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
                                Navigator.push(context, MaterialPageRoute(builder:
                                (context) => SubCategoryScreen(id: model.data[index].id,),
                                ));
                              },
                            );
                          },
                        ),
                        SizedBox(height: 10,),
                        Text(
                          'Top Advisor',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white
                                ),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius: 35,
                                    ),
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
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white
                                ),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius: 35,
                                    ),
                                    Text('Dr. Jasica Nobo',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text('Gynecologists',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.blue
                                      ),
                                    ),
                                    Text('05:00 pm - 06:00 pm'),
                                  ],
                                ),
                              ),
                            ],
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

