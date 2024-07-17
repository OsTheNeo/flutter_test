import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catbreeds/blocs/bloc.dart';
import 'package:catbreeds/ui/widgets/cat_breed_card.dart';
import 'package:catbreeds/ui/widgets/search_bar.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CatBreedsBloc>(context).add(FetchCatBreeds());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catbreeds'),
      ),
      body: Column(
        children: [
          CustomSearchBar(
            onSearch: (query) {
              BlocProvider.of<CatBreedsBloc>(context).add(SearchCatBreeds(query));
            },
          ),
          Expanded(
            child: BlocBuilder<CatBreedsBloc, CatBreedsState>(
              builder: (context, state) {
                if (state is CatBreedsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is CatBreedsLoaded) {
                  return ListView.builder(
                    itemCount: state.breeds.length,
                    itemBuilder: (context, index) {
                      return CatBreedCard(breed: state.breeds[index]);
                    },
                  );
                } else if (state is CatBreedsError) {
                  return Center(child: Text(state.message));
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}