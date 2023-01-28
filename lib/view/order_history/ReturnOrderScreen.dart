import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vkreta/services/apiservice.dart';

import '../../models/MyOrderHistoryModel.dart';

class ReturnOrderScreen extends StatefulWidget {
  final String order_id;
  final Product product;
  final Status status;
  const ReturnOrderScreen(
      {required this.product,
      required this.order_id,
      required this.status,
      Key? key})
      : super(key: key);

  @override
  State<ReturnOrderScreen> createState() => _ReturnOrderScreenState();
}

class _ReturnOrderScreenState extends State<ReturnOrderScreen> {
  bool valuesecond = false;
  final ImagePicker _picker = ImagePicker();
  List<File> list = [];
  TextEditingController title = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController productName = TextEditingController();
  TextEditingController orderDate = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController comment = TextEditingController();
  TextEditingController paymentType = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController boxStatus = TextEditingController();
  TextEditingController bankCode = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController bankAccountNumber = TextEditingController();
  String label = "Title";
  postReturn() async {
    var response = ApiService().orderReturn(
        order_id: widget.order_id,
        product_id: widget.product.productId!,
        comment: comment.text,
        firstname: firstName.text,
        lastname: lastName.text,
        email: email.text,
        telephone: telephone.text,
        date_ordered: orderDate.text,
        product: productName.text,
        model: model.text,
        payment_code: paymentType == "cash" ? "cod" : "Razorpay",
        quantity: quantity.text,
        return_reason_id: 0.toString(),
        opened: boxStatus == "open" ? "0" : "1",
        bank_swift_code: bankCode.text,
        bank_account_name: bankAccountNumber.text,
        bank_account_number: bankAccountNumber.text,
        agree: 1.toString(),
        image: list).then((value){
          if(value['success']!= null){
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              title: 'Congratulation',
              desc: 'Your Request Successfully saved',
              btnOkColor: Colors.blue.shade900,
              btnOkOnPress: ()=>Navigator.of(context)..pop(),
            ).show();
          }else{
            Fluttertoast.showToast(msg: "Somethings went wrong");
          }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Return Order Screen"),
      ),
      bottomNavigationBar: Container(
        height: width * 0.3,
        padding: EdgeInsets.symmetric(
            vertical: width * 0.04, horizontal: width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: width * 0.08,
              child: Row(
                children: [
                  Checkbox(
                    value: valuesecond,
                    onChanged: (value) {
                      setState(() {
                        valuesecond = value!;
                      });
                    },
                  ),
                  const Text("I accept all the term and Conditions"),
                ],
              ),
            ),
            ElevatedButton(onPressed: postReturn, child: const Text("Submit"))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: width * 0.04, horizontal: width * 0.04),
          child: Column(
            children: [
              TextBox(title: firstName, label: "First Name"),
              SizedBox(
                height: width * 0.04,
              ),
              TextBox(title: lastName, label: "LastName"),
              SizedBox(
                height: width * 0.04,
              ),
              TextBox(title: email, label: "Email"),
              SizedBox(
                height: width * 0.04,
              ),
              TextBox(title: telephone, label: "Telephone"),
              SizedBox(
                height: width * 0.04,
              ),
              TextBox(title: productName, label: "Product Name"),
              SizedBox(
                height: width * 0.04,
              ),
              TextBox(title: orderDate, label: "Order Date"),
              SizedBox(
                height: width * 0.04,
              ),
              TextBox(title: model, label: "Model"),
              SizedBox(
                height: width * 0.04,
              ),
              TextBox(title: paymentType, label: "Payment (cash , Razorpay)"),
              SizedBox(
                height: width * 0.04,
              ),
              TextBox(title: quantity, label: "Qantity"),
              SizedBox(
                height: width * 0.04,
              ),
              TextBox(title: boxStatus, label: "Box (open , close)"),
              SizedBox(
                height: width * 0.04,
              ),
              TextBox(title: comment, label: "Comment"),
              SizedBox(
                height: width * 0.04,
              ),
              TextBox(title: bankCode, label: "Bank Swift Code"),
              SizedBox(
                height: width * 0.04,
              ),
              TextBox(title: bankName, label: "Bank Swift Name"),
              SizedBox(
                height: width * 0.04,
              ),
              TextBox(
                  title: bankAccountNumber, label: "Bank Swift Account Number"),
              SizedBox(
                height: width * 0.04,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.grey)),
                child: ListTile(
                  onTap: () async {
                    final XFile? image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      setState(() {
                        list.add(File(image.path));
                      });
                    }
                  },
                  leading: const Icon(Icons.image),
                  title: const Text("Add Images"),
                ),
              ),
              SizedBox(
                height: width * 0.04,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: width * 0.04,
                  );
                },
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      list.removeAt(index);
                    },
                    child: Container(
                        height: width * 0.7,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              list[index].readAsBytesSync(),
                              fit: BoxFit.fill,
                            ))),
                  );
                },
                shrinkWrap: true,
                itemCount: list.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  const TextBox({
    Key? key,
    required this.title,
    required this.label,
  }) : super(key: key);

  final TextEditingController title;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: title,
      decoration: InputDecoration(
        labelText: label,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade900, width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
      ),
    );
  }
}
