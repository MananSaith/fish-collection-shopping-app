

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/cardprovider.dart';

class AddCardPage extends StatefulWidget {
   const AddCardPage({super.key});
   
   

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  
  
  @override
  Widget build(BuildContext context) {
    final card=Provider.of<CardProvider>(context).card;
    return  Scaffold(
      appBar:AppBar(
             title: const Text("Add Card Detail"),
             centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: card.length,
        
        itemBuilder: (context, index){
          final cardlist=card[index];
          return ListTile(
           leading:CircleAvatar(
              backgroundImage: AssetImage(cardlist['pikurl'] as String),
              radius: 30, 
            ),
            trailing: IconButton(
              onPressed: (){
                showDialog(
                  context: context, 
                  builder: (context){
                      return  AlertDialog(
                       title: Text(
                        "Product Delete",
                       style: Theme.of(context).textTheme.bodyMedium,
                        ),
                         content: Text(
                        "Are You Sure you Wanna Remove ${cardlist['title']} from your card list",
                       style: Theme.of(context).textTheme.bodySmall,
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            }, 
                            child:const Text("NO",style: TextStyle(color: Colors.blue,fontSize: 15),)
                            ),
                            TextButton(
                            onPressed: (){
                              Provider.of<CardProvider>(context,listen: false).removecard(cardlist);
                                 Navigator.of(context).pop();
                            }, 
                            child:const  Text("YES",style: TextStyle(color: Colors.red,fontSize: 15))
                            ),
                        ],
                );
                  },
                );
              },
              icon:const Icon(Icons.delete,color: Colors.red,),
              ),
            title: Text(cardlist['title'].toString()),
            subtitle: Text(
              'Total Pice ${cardlist['count'].toString()} Price ${cardlist['price'].toString()}',
              style:const TextStyle(fontSize: 15),
              ),
          );
        },
    ),
    );
  }
}