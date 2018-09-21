# README

This README would normally document whatever steps are necessary to get the
application up and running.


Step 1 -> Bundle install

Step 2 -> run command "rake db:create"

Step 3 -> run command "rake db:migrate"

Step 4 -> run server command "rails s"

Step 2 -> run console command "rails c"

Api


CREATE USER API

	curl -H "Content-Type: application/json" -X POST -d '{"email":"qwert@mail.com","password":"123123123","password_confirmation":"123123123"}' http://localhost:3000/create


AUTHENTICATE USER API

	curl -H "Content-Type: application/json" -X POST -d '{"email":"qwert@mail.com","password":"123123123"}' http://localhost:3000/authenticate


AUTHORIZATION ACCESS ITEMS API

	curl -H "Authorization:eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1Mzc2MTA4NTh9.TxK7bsKqm-Olk_CsKSQqqIWF6pPZFdT4MV6ta4j1kJo" http://localhost:3000/items


CREATE ITEM API WITH AUTHORIZATION

	curl -H "Content-Type: application/json" -H "Authorization:eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1Mzc2MTA4NTh9.TxK7bsKqm-Olk_CsKSQqqIWF6pPZFdT4MV6ta4j1kJo" -X POST -d '{"name":"item1","description":"it is item 1"}' http://localhost:3000/items