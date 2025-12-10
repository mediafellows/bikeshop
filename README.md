# Bikeshop

Bikeshop is a Ruby on Rails application implementing an API for managing a bicycle shop.

### Prerequisites

- Ruby 3.2+
- Rails 8.1
- PostgreSQL or Sqlite

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/mediafellows/bikeshop.git
   cd bikeshop
   ```

2. Install dependencies:
   ```
   bundle install
   ```

3. Choose your database. Postgres is setup by default in `config/database.yml` but there is a config for sqlite there as well

4. Set up and seed the databases:
   ```
   bin/rails db:setup
   ```

## Testing

Run the test suite with:

```
bin/rspec
```
