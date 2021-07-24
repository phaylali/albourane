import 'package:admin/controllers/marinNewController.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MarinInput extends GetView<MarinInputController> {
  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: 'بحار جديد',
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 20,
        runSpacing: 20,
        children: [
          SizedBox(
            width: 300,
            height: 70,
            child: OutlinedButton(
                onPressed: null,
                child: ListTile(
                  title: TextFormField(
                      decoration: InputDecoration(
                        labelText: "الاسم العائلي",
                      ),
                      keyboardType: TextInputType.text,
                      controller: controller.lastNameController),
                )),
          ),
          SizedBox(
            width: 300,
            height: 70,
            child: OutlinedButton(
                onPressed: null,
                child: ListTile(
                  title: TextFormField(
                      decoration: InputDecoration(
                        labelText: "الاسم الشخصي",
                      ),
                      keyboardType: TextInputType.name,
                      controller: controller.firstNameController),
                )),
          ),
          SizedBox(
            width: 300,
            height: 70,
            child: OutlinedButton(
                onPressed: null,
                child: ListTile(
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: "التسجيل",
                    ),
                    keyboardType: TextInputType.url,
                    controller: controller.referenceController,
                  ),
                )),
          ),
          SizedBox(
            width: 300,
            height: 70,
            child: OutlinedButton(
                onPressed: null,
                child: ListTile(
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: "الصورة",
                    ),
                    keyboardType: TextInputType.url,
                    controller: controller.imgController,
                  ),
                )),
          ),
          SizedBox(
            width: 300,
            height: 70,
            child: OutlinedButton(
                onPressed: null,
                child: ListTile(
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: "الضمان الاجتماعي",
                    ),
                    //keyboardType: TextInputType.name,
                    controller: controller.cnssController,
                  ),
                )),
          ),
          SizedBox(
            width: 300,
            height: 70,
            child: OutlinedButton(
                onPressed: null,
                child: ListTile(
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: "رقم البطاقة",
                    ),
                    //keyboardType: TextInputType.name,
                    controller: controller.cniController,
                  ),
                )),
          ),
          SizedBox(
            width: 300,
            height: 70,
            child: OutlinedButton(
                onPressed: null,
                child: ListTile(
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: "الهاتف",
                    ),
                    keyboardType: TextInputType.phone,
                    controller: controller.phoneController,
                  ),
                )),
          ),
          Center(
            child: SizedBox(
                height: 70,
                width: 300,
                child: OutlinedButton(
                    onPressed: () {
                      controller.addMarin();
                    },
                    child: ListTile(
                      title: Text(
                        'اضف البحار',
                        textAlign: TextAlign.center,
                      ),
                    ))),
          ),
        ],
      ),
    );
  }
}
