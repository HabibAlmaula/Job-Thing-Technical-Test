part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<Candidate> candidates;
  final List<Blog> blogs;
  final List<dynamic> mixedData;

  final RequestState candidatesRequestState;
  final RequestState blogsRequestState;

  final String candidatesMessage;
  final String blogsMessage;

  final String searchQuery;

  const HomeState({
    this.candidates = const [],
    this.blogs = const [],
    this.mixedData = const [],
    this.candidatesRequestState = RequestState.Empty,
    this.blogsRequestState = RequestState.Empty,
    this.candidatesMessage = '',
    this.blogsMessage = '',
    this.searchQuery = '',
  });

  HomeState copyWith({
    List<Candidate>? candidates,
    List<Blog>? blogs,
    List<dynamic>? mixedData,
    RequestState? candidatesRequestState,
    RequestState? blogsRequestState,
    String? candidatesMessage,
    String? blogsMessage,
    String? searchQuery,
  }) {
    return HomeState(
      candidates: candidates ?? this.candidates,
      blogs: blogs ?? this.blogs,
      mixedData: mixedData ?? this.mixedData,
      candidatesRequestState:
          candidatesRequestState ?? this.candidatesRequestState,
      blogsRequestState: blogsRequestState ?? this.blogsRequestState,
      candidatesMessage: candidatesMessage ?? this.candidatesMessage,
      blogsMessage: blogsMessage ?? this.blogsMessage,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [
        candidates,
        blogs,
        mixedData,
        candidatesRequestState,
        blogsRequestState,
        candidatesMessage,
        blogsMessage,
        searchQuery,
      ];
}
