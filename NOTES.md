Build a CLI that:

- Takes a search query from user.
- Displays a list of five books matching that query (each item needs to include author, title, and publishing company)
- User can select a book and add it to a reading list
- View the reading list with all selected books.


Need a class that controls the CLI flow

Need a class that fetches data from the API

Separate class for parsing the data (?)

Class for reading list

Flow:

- On running application, user is greeted with a welcome message.
- User is prompted to enter a search query to find something to read or view their reading list.
- If user selects view reading list, the list appears.
- If user enters a search query, a numbered list of five books appears.
- User can select a number to add it to the reading list.
- User can view reading list at will.

Classes:

- CLI: controls application flow
- BookSearch: gets data from API
- BookList: parses data
- ReadingList: creates reading list
