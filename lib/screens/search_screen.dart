import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone/utils/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isShowUser = false;

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: TextFormField(
          controller: searchController,
          decoration: const InputDecoration(
            labelText: 'Search for a user'
          ),
          onFieldSubmitted: (String _){
            setState(() {
              isShowUser = true;
            });
          },
        ),
      ),
      body: isShowUser ? _buildUserNameImage() : _buildPostData(),
    );
  }

  FutureBuilder<QuerySnapshot<Map<String, dynamic>>> _buildPostData() {
    return FutureBuilder(
      future: FirebaseFirestore.instance
      .collection('posts')
      .get(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return const Center(child: CircularProgressIndicator(),);
        }
        return StaggeredGridView.countBuilder(
          crossAxisCount: 3,
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) => Image.network(
            (snapshot.data! as dynamic).docs['index']['postUrl'],
            fit: BoxFit.cover,
          ),   
          staggeredTileBuilder: (index) => StaggeredTile.count(
            (index % 7 == 0) ? 2:1, 
            (index % 7 == 0) ? 2:1
          ),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        );
      },
    );
  }

  FutureBuilder<QuerySnapshot<Map<String, dynamic>>> _buildUserNameImage() {
    return FutureBuilder(
      future: FirebaseFirestore.instance
      .collection('users')
      .where('username', isGreaterThanOrEqualTo: searchController.text)
      .get(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index){
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  (snapshot.data! as dynamic).docs[index]['photoUrl']
                ),
              ),

              title: Text((snapshot.data! as dynamic).docs[index]['username']),

            );
          }
        );
      }
    );
  }
}