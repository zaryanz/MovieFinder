<h1 align="center">
<img width="128" height="128" src="https://github.com/user-attachments/assets/3f453e66-2cff-48ea-ba17-7c0bc130c5eb" alt="MovieFinder App Icon" />
  <br />
  MovieFinder
  <br />
</h1>
<p align="center">Find your favorite movies, series and look at the imDB ratings. Save movies you want to watch later in the offline Watchlist!</p>
<p align="center">
  <img src="https://img.shields.io/badge/Language-Swift-blue.svg">
  &nbsp;&nbsp;
  <a href="LICENSE.md"><img src="https://img.shields.io/badge/License-MIT-brightgreen.svg"></a>
</p>

## Functionality
- **Search Screen (Home Tab)**: Displays a list of movies and series based on search queries typed in by the user using the OMDB API. On clicking any of the movies/series in the list, the user is taken to the Movie/Series Details screen.
- **Movie/Series Details Screen**: Fetches details such as movie title, plot, imDB rating, director, and genre. The bookmark icon can be used as a toggle to add or remove the movie from the watchlist.
- **Watchlist Screen (Watchlist Tab)**: Displays a list of movies and series that were saved by the user in the watchlist. On any of the movies/series in the list, the user is taken to the Movie/Series Details screen.

## Screenshots

<table>
  <tr>
    <td>
      <img width="401" height="870" src="https://github.com/user-attachments/assets/5cb07edf-6555-46b6-90c9-31963b7f8a82"></img>
    </td>
    <td>
      <img width="401" height="870" src="https://github.com/user-attachments/assets/5de453b2-0d50-4d66-99bb-f166651660c7"></img>
    </td>
  </tr>
</table>

## Technical Overview
- **MVVM**: The app is built using the Model-View-ViewModel (MVVM) architecture. The View is separated from the Model through an intermediary layer called the ViewModel.
- **Core Data**: The watchlist functionality uses Core Data for persisting movies/series bookmarked by the user.
- **Modularity**: The UI is divided into re-usable UI components that can be imported and used in different places across the app.
