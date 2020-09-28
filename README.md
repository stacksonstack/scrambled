# APIs
- some additional gems we'll need (RestClient & JSON)
- what are CRUD actions and how do those relate to our requests? 
  - a lot of this you'll see in Mod2 
- Different types of APIs
  - some you'll need an API key for 
- Make some requests, talk about how we'll use them in our apps 


## What is an API 
- Our own DBs with Ruby, AR, and SQLite3
- In order to request info from a DB, we go through the API and how it specifies how we make requests
- FB or Google Auth (OAuth is clutch in Mod5)


## CRUD Actions & HTTP Verbs
Create -- POST 
Read -- GET --- just look at the info  (MOST FREQUENTLY USED!!!)
Update -- PATCH / PUT 
Delete -- DELETE 

- You'll do full CRUD on your DB and just use the API if helpful for seeding or searching 

## How we use the APIs
- Use the API to seed
- Use it to search (and end up adding records to your own DB)

### re: seeding
- Which models are dependent on other ones? Seed those later. Create the instances that don't belong to anybody first 
- Make sure you have all your API stuff ready to go (aka keys, testing hitting endpoints with RestClient)
- Which endpoints do you need? Are they still active? 
- What data are you expecting to get? How ya gonna use it? 


# CLIs
- CLI class to help us clean up our code 



# Icebox
- Copying today's lecture code to start your project (into new folder)
