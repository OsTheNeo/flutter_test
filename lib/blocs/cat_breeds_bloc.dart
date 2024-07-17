import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catbreeds/data/repositories/cat_repository.dart';
import 'package:catbreeds/blocs/cat_breeds_event.dart';
import 'package:catbreeds/blocs/cat_breeds_state.dart';

class CatBreedsBloc extends Bloc<CatBreedsEvent, CatBreedsState> {
  final CatRepository _catRepository;

  CatBreedsBloc(this._catRepository) : super(CatBreedsInitial()) {
    on<FetchCatBreeds>(_onFetchCatBreeds);
    on<SearchCatBreeds>(_onSearchCatBreeds);
  }

  void _onFetchCatBreeds(FetchCatBreeds event, Emitter<CatBreedsState> emit) async {
    emit(CatBreedsLoading());
    try {
      final breeds = await _catRepository.getBreeds();
      emit(CatBreedsLoaded(breeds));
    } catch (e) {
      emit(CatBreedsError(e.toString()));
    }
  }

  void _onSearchCatBreeds(SearchCatBreeds event, Emitter<CatBreedsState> emit) async {
    emit(CatBreedsLoading());
    try {
      final breeds = await _catRepository.getBreeds();
      final filteredBreeds = breeds.where((breed) =>
          breed.name.toLowerCase().contains(event.query.toLowerCase())).toList();
      emit(CatBreedsLoaded(filteredBreeds));
    } catch (e) {
      emit(CatBreedsError(e.toString()));
    }
  }
}