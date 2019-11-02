# Reader

Welcome to Reader! This CLI makes it easy to find great books to read. Enter any word or phrase, and it will show you five books matching your query. You can search as many times as you like, and add titles you're interested in to a reading list.

## Installation

1. `cd` into the directory you'd like Reader to live in, or make a new one.
2. Fork and clone this repository.
3. Run `bundle install` to install required gems.
4. Open the program in your text editor of choice.
5. You will need to supply your own Google Books API key for Reader to function. Just follow [these directions](https://developers.google.com/books/docs/v1/using) to set one up.
6. Create a file in the `reader` directory called `.env`
7. In `.env`, add your API key like so: `GOOGLE_BOOKS_KEY='enter your personal API key here'` (This file is gitignored in case you are developing on this program).
8. Run `rspec` to test. Green means you're good to go!

## Usage

1. Run `ruby ./bin/read` to start the program.
2. It will ask if you'd like to find something to read. Enter 'y' for yes.
3. Enter a word or phrase to search for relevant books.
4. A numbered list of five books will appear, showing title, author, and publisher.
5. Add a book to your reading list by entering the corresponding number.
6. You can then view your most recent search, or search again.
7. When you finish searching, view your list to see all the books you are interested in. Be sure to copy this list elsewhere, since it will not persist after you exit the program.
8. Obtain those books from your supplier of choice and read to your heart's content!

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/palledorous/reader. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
