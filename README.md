# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


 +-------------+     +-------------------+   
    |   user      |     |      shohin       | 
    +-------------+     +-------------------+ 
    | userID (PK) |     | shohinID (PK)    | 
    | nickname    |     | image            |
    | email       |     | name             |
    | password    |     | sethumei         | 
    | name        |     | category         | 
    | zenkakuname |     | jotai            | 
    | birthday    |     | hutan            | 
    |             |     | region           |
    |             |     | nissu            | 
    |             |     | price            |
    |             |     | seller (FK)      
    +-------------+     +-------------------+ 

                           |
                           |
                           |
    -----------------------
    |
    |
    |
    |
    v
    +-------------+
    |   konyu     |
    +-------------+
    | konyuID (PK)|
    | who         |
    | what        |
    | buyer       |
    +-------------+
