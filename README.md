# MovieFinder
Find your favorite movies, series and look at the imDB ratings. Save movies you want to watch later in the offline Watchlist!

## Functionality
- **Search Screen (Home Tab)**: Displays a list of movies and series based on search queries typed in by the user using the OMDB API. On clicking any of the movies/series in the list, the user is taken to the Movie/Series Details screen.
- **Movie/Series Details Screen**: Fetches details such as movie title, plot, imDB rating, director, and genre. The bookmark icon can be used as a toggle to add or remove the movie from the watchlist.
- **Watchlist Screen (Watchlist Tab)**: Displays a list of movies and series that were saved by the user in the watchlist. On any of the movies/series in the list, the user is taken to the Movie/Series Details screen.

## Screenshots

<table>
<tr>
<td>
<img width="401" height="870" src="https://github.com/user-attachments/assets/c087fca2-c6c4-4826-a1c7-6bdb93245579"></img>
</td>
<td>
<img width="401" height="870" src="https://github.com/user-attachments/assets/fe6085bc-38d6-4718-b690-cd68eb7ead1d"></img>
</td>
</tr>
</table>

## Technical Overview
- **MVVM**: The app is built using the Model-View-ViewModel (MVVM) architecture. The View is separated from the Model through an intermediary layer called the ViewModel.
- **Core Data**: The watchlist functionality uses Core Data for persisting movies/series bookmarked by the user.
- **Modularity**: The UI is divided into re-usable UI components that can be imported and used in different places across the app.
