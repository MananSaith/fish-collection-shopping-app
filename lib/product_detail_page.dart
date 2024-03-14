import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/cardprovider.dart';



class ProDetailPage extends StatefulWidget {
  final Map<String,Object> product;

   const ProDetailPage({super.key,required this.product});

  @override
  State<ProDetailPage> createState() => _ProDetailPageState();
}

class _ProDetailPageState extends State<ProDetailPage> {
  int count=1;

  void ontap(){
       Provider.of<CardProvider>(context,listen: false).addcard(
        {
    'id':widget.product['id'] ,
    'title':widget.product['title'] ,
    'price':count*(widget.product['price'] as int),
    'pikurl':widget.product['pikurl'] ,
    'count':count
  }
       );
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content:Center(child: Text("product added successfully",style: Theme.of(context).textTheme.bodySmall,)),
          backgroundColor:const  Color.fromARGB(71, 197, 194, 194),
          ),
          );

  }

  void increse()=>++count;
  void decrese()=>--count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
        ),

      body: Padding(
        padding: const EdgeInsets.only(left: 8,right: 8),
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                         Text(widget.product['title'] as String,style:const TextStyle(fontSize: 30),maxLines: 1,),
                         const Spacer(flex: 1,),
                         Center(child: Image(image: AssetImage(widget.product['pikurl'] as String),height: 250,)),
                         const Spacer(flex: 2,),

                         Container(
                          
                          padding:const EdgeInsets.all(24),
                          height: 250,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color:  Color.fromRGBO(216, 240, 253, 1),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('$count pice : ${count*(widget.product['price'] as int)} PKR',style: Theme.of(context).textTheme.bodyMedium,),
                              const SizedBox(height: 20,),
                              Row(
                                    children: [
                                      Chip(
                                        padding:const EdgeInsets.only(left: 12,right: 12),
                                        label: Text('$count',style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                      
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                        ),
                                     const   SizedBox(width: 20,),
                                       IconButton(
                                        onPressed: (){
                                          setState(() {
                                            if(count<=1){

                                            }
                                            else{decrese();}
                                            
                                          });
                                        }, 
                                        icon: const Icon(Icons.remove),
                                        iconSize: 30,
                                        ),
                                        const   SizedBox(width: 8,),
                                       IconButton(
                                        onPressed: (){setState(() {
                                            increse();
                                          });}, 
                                        icon:const Icon(Icons.add),
                                        iconSize: 30,
                                        ),
                                    ],
                              ),
                              const SizedBox(height: 20,),

                               ElevatedButton.icon(

                                style: ElevatedButton.styleFrom(
                                    backgroundColor:Theme.of(context).colorScheme.primary,
                                    minimumSize: const Size(double.infinity, 50)
                                ),
                                onPressed: (){
                                ontap();

                                }, 
                                icon:const  Icon(Icons.shopping_cart,color: Colors.black,),
                                label:const Text('Add To Card',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)
                                ),
                            ],
                          ),
                         )


              ],
        
        ),
      ),  
    );
  
  }
}

