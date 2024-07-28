# README


# URL Crawler

URL Crawler is a Ruby on Rails application designed to fetch and parse content from multiple URLs. The application extracts metadata such as title, description, keywords, author, viewport, and robots information from the given URLs and performs basic content classification based on word frequency.

## Features

- Fetch metadata from multiple URLs.
- Extract information such as title, description, keywords, author, viewport, and robots.
- Basic content classification using word frequency.
- API endpoint to accept multiple URLs in a single request.

## Setup

Follow these steps to set up and run the URL Crawler application.

### Prerequisites

- Ruby (version 3.1.2 or later)
- Rails (version 7.0 or later)
- PostgreSQL (for production)
- SQLite3 (for development and test)
- Node.js and Yarn (for managing JavaScript dependencies)

### Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/SanchitTaliyan/url_crawler.git
   cd url_crawler
   ```

2. **Install Required Gems**

   Make sure you have Bundler installed:

   ```bash
   gem install bundler
   ```

   Install the gems:

   ```bash
   bundle install
   ```

3. **Set Up the Database**

   For development (using SQLite3):

   ```bash
   rails db:create
   rails db:migrate
   ```

   For production (using PostgreSQL), configure your `config/database.yml` with your PostgreSQL settings and then run:

   ```bash
   rails db:create RAILS_ENV=production
   rails db:migrate RAILS_ENV=production
   ```

4. **Install JavaScript Dependencies**

   ```bash
   yarn install
   ```

### Running the Application

1. **Start the Rails Server**

   ```bash
   rails server
   ```

   The application will be available at `http://localhost:3000`.

### Testing the API

To test the API, you can use `curl` or any API client like Postman. Below are the steps to test the API using `curl`.

1. **Single URL**

   ```bash
   curl -X POST http://localhost:3000/api/v1/crawl_pages -H "Content-Type: application/json" -d '{
     "url": "http://www.amazon.com/Cuisinart-CPT-122-Compact-2-Slice-Toaster/dp/B009GQ034C/ref=sr_1_1?s=kitchen&ie=UTF8&qid=1431620315&sr=1-1&keywords=toaster"
   }'
   ```

2. **Multiple URLs**

   ```bash
   curl -X POST http://localhost:3000/api/v1/crawl_pages -H "Content-Type: application/json" -d '{
     "urls": [
       "http://www.amazon.com/Cuisinart-CPT-122-Compact-2-Slice-Toaster/dp/B009GQ034C/ref=sr_1_1?s=kitchen&ie=UTF8&qid=1431620315&sr=1-1&keywords=toaster",
       "http://blog.rei.com/camp/how-to-introduce-your-indoorsy-friend-to-the-outdoors/",
       "http://www.cnn.com/2013/06/10/politics/edward-snowden-profile/"
     ]
   }'
   ```

The API will return the metadata and classified topics for each URL.

### Contributing

Feel free to submit issues or pull requests if you have any improvements or bug fixes.

### License

This project is licensed under the MIT License.

---

This README provides a comprehensive overview of the URL Crawler application, including setup, running, and testing instructions. This should help users and contributors get started with your project easily.
