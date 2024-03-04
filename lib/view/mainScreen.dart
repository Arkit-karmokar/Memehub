import 'package:flutter/material.dart';
import 'package:memehub/controller/fetchmeme.dart';
import 'package:memehub/controller/sharemydata.dart';

class mainScreen extends StatefulWidget {
const mainScreen({super.key});
  @override
  State<mainScreen> createState() => _mainScreenState();
}



class _mainScreenState extends State<mainScreen> {
  String imgUrl = "";
  int? memeNo;
  int targetMeme = 100;
  bool isLoading = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

        GetInitMemeNo();
    UpdateImg();
  }

  GetInitMemeNo() async{
    memeNo = await SaveMyData.fetchData() ?? 0;
    if(memeNo!>100){
      targetMeme = 500;
    }
    else if(memeNo! > 500){
      targetMeme = 1000;
    }
    setState(() {

    });


}

  void UpdateImg() async{

    String getImgUrl = await FetchMeme.fetchNewMeme();

    setState(() {
      imgUrl = getImgUrl;
      isLoading = false;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('meme #${memeNo.toString()}',style: TextStyle(fontSize: 25, fontWeight:FontWeight.w600),),
                SizedBox(height: 10,),
                Text('target ${targetMeme} memes ',style: TextStyle(fontSize: 18),),
                SizedBox(height: 30,),

                isLoading ?
                Container(
                height : 300,
                width : MediaQuery.of(context).size.width,
                    child : Center(
                        child : SizedBox(
                            height : 60,
                            width : 60,
                            child: CircularProgressIndicator())
                    )
                ):
                Image.network(height:300, width:MediaQuery.of(context).size.width,
                    fit:BoxFit.fitHeight,
                    imgUrl),

                SizedBox(height:20,),
                ElevatedButton(
                    onPressed: () async{
                      await SaveMyData.savaData(memeNo!+0);
                      GetInitMemeNo();
                      UpdateImg();
                    },
                    child:Container(
                        height: 50,
                        width:150,
                        child:
                        Center(child:Text('More fun', style:TextStyle(fontSize: 20)))))
              ],
            )
        )
    );
  }
}
