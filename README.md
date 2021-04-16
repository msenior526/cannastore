# CannaStore

A Rails app that displays cannabis strains. Users can leave a review, add and remove from favorite, and create strains. 
---

## Installation

Fork and clone the repo. Once installed locally, run 
```
$ bundle install
```
to install dependencies. Migrate, and seed the database with
```
$ rails db:migrate
$ rails db:seed
```

## Usage
 To start the applications server, run
```
$ rails s
```
Open your browser to localhost:3000 to get started.

A user can signup on the site, or use a gmail account through third party authentication. Users can add a strain to your favorites, and remove it, only when logged in. Reviewing a strain is also only possible while logged in.

