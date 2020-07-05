# Movie API

This project makes it possible to create a movie and also get a list of saved movies with an age censure filter.
It uses Ruby 2.7.1, Rails 6 and it is needed Postgres 12.

# What do you need to run the project

Clone this project and run those commands in sequence:

* bundle install
* rails db:create
* rails db:migrate
* rails s

# API documentation

[API mind map](http://www.xmind.net/m/yDVCCf)

# How it works

This API has two endpoint: 
* A POST endpoint (api/v1/movie) where user can create an movie with specific parameters and following some rules (see mind map for more information). 
* A GET endpoint (api/v1/movie/censure/:age) where user can get all movies, passing an age parameter of censure.

IMPORTANTE NOTICE: This API is considering Brazilian's law for censure classification. If a movie has classification for less than 10 years old, it is applied "free classification". Otherwise, it is not recommended for minors and has it own classsification. For more information: [see brazilian classification law.](https://www.justica.gov.br/seus-direitos/classificacao/cartilh_informacaoliberdadeescolha.pdf)


# Requests examples and given returns



