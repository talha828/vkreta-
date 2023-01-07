import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vkreta/getx_controllers/trackOrderController.dart';
import 'package:vkreta/models/TrackOrderModel.dart';
import 'package:vkreta/services/apiservice.dart';
import 'package:intl/intl.dart';

class TrackScreen extends StatefulWidget {
  final String orderId;
  final String productId;
  final String sellerId;
  const TrackScreen({required this.orderId,required this.sellerId,required this.productId,Key? key}) : super(key: key);

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  var time=DateFormat("dd-MM-yyyy");
  final TrackOrderController track=Get.put(TrackOrderController());
  getTrack()async{
    var response=ApiService().getOrderTrack(orderId: widget.orderId, productId: widget.productId, sellerId: widget.sellerId).then((value){
      track.track.value=TrackOrderModel.fromJson(value);
      setState(() {});
    });

  }
  @override
  void initState() {
    getTrack();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:const Icon(Icons.arrow_back_ios),onPressed: ()=>Navigator.pop(context),),
        title:const Text("Track Order"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04,vertical:  width * 0.04),
        child: Column(
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Order Id#",style: TextStyle(fontWeight: FontWeight.bold,fontSize: width * 0.05),),
                  Text(track.track.value.orderId!,style: TextStyle(fontSize: width * 0.05),),
                ],
              ),
            const Divider(color: Colors.grey,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Date",style: TextStyle(fontWeight: FontWeight.bold,fontSize: width * 0.05),),
                Text("DD-MM-YYYY",style: TextStyle(fontSize: width * 0.05),),
              ],
            ),
            const Divider(color: Colors.grey,),
            Row(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: width * 0.04,horizontal: width * 0.04),
                child: Text("Track",textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold,fontSize: width * 0.05),),
                ),
              ],
            ),
            SizedBox(height: width * 0.04,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(7)
              ),
              child:ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                return ListTile(
                  title: Text(track.track.value.history![index].name!),
                  subtitle: Text(track.track.value.history![index].description!),
                  trailing: Text(track.track.value.history![index].date!.substring(0,10),),
                );
              }, separatorBuilder: (context,index){
                return SizedBox(height: width * 0.04,);
              }, itemCount: track.track.value.history!.length) ,
            )
          ],
        ),
      ),
    );
  }
}
