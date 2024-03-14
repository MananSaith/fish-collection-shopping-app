import 'package:flutter/material.dart';

class ProCard extends StatelessWidget {
  final String title;
  final int price;
  final String pikurl;
  final Color bgcolor;
   const ProCard({
    super.key,
    required this.title,
    required this.price,
    required this.pikurl,
    required this.bgcolor
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 270,
      padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
      decoration:  BoxDecoration(
        //color:const Color.fromRGBO(216, 240, 253, 1),
              color: bgcolor,
              borderRadius: BorderRadius.circular(50)
              
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
           children: [
            Text(title,style: Theme.of(context).textTheme.bodyMedium),
           const SizedBox(height: 5,),
           Text('$price PKR',style: Theme.of(context).textTheme.bodySmall),
           const SizedBox(height: 5,),
           Center(child: Image(image: AssetImage(pikurl),height: 140,))
      
           ],
      ),
    );
  }
}