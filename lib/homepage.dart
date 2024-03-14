
import 'package:flutter/material.dart';
import 'package:shoping_app/list_product.dart';
import 'package:shoping_app/product_card.dart';
import 'package:shoping_app/product_detail_page.dart';
import 'package:shoping_app/stylepage.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> fishtypes=[
    'All',
    'Golden',
    'Angel',
    'Turtle',
    'Guppy',
    'Neon tetra',
    'Corydoras Cat',
    'Dwarf Gourami',
    'Rainbow',
    'Mollies',
    'Discus',   
    ];
    late String selectedfishtype;
    @override
    void initState() {
    super.initState();
     selectedfishtype=fishtypes[0];

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("Fish\nCollection",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                ),
                Expanded(
                  child:TextField(
                    style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      
                      border: border,
                      enabledBorder: border,
                    focusedBorder: border,
                    ),
                  )
                  ),
              ],
            ),
            SizedBox(
              height:100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:fishtypes.length ,
                itemBuilder: (context,index){
                  final displayfish=fishtypes[index];
                  return Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 8), 
                    child: GestureDetector(
                      onTap: (){
                     
                      setState(() {
                        selectedfishtype=displayfish;
                      });
                       
                      },
                      child: Chip(
                        backgroundColor:selectedfishtype==displayfish?
                         Theme.of(context).colorScheme.primary:
                         const Color.fromARGB(21, 185, 183, 183),
                        side:const BorderSide(
                          color:   Color.fromARGB(21, 185, 183, 183),
                        ),
                        label: Text(displayfish,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        padding:const EdgeInsets.only(left: 15,right: 15,top: 12,bottom: 12),
                        // side: const BorderSide(
                        //        borderRadius
                        // ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    )
                  );

                }
                ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: product.length,
                itemBuilder: (context,index){
                  final pro=product[index];
                     return GestureDetector(
                      onTap: (){
                             Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return ProDetailPage(product:pro);
                             }));

                      },
                       child: ProCard(
                        title:pro['title'] as String,
                        price: pro['price'] as int,
                        pikurl: pro['pikurl'] as String,
                        bgcolor: index.isEven?const Color.fromRGBO(216, 240, 253, 1):const Color.fromARGB(21, 185, 183, 183),
                        ),
                     );
                }
                ),
            ),
          ],
        ),
      ),
    );
  }
}