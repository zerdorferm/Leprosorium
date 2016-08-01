#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' #чтобы не перезапускать приложение каждый раз
require 'sqlite3' #добавляем строку после установки гема


#инициализирует глобальную переменную
def init_db 
	@db = SQLite3::Database.new 'leprosorium.db' #SQLite3 обращается к модулю require 'sqlite3'
	@db.results_as_hash = true #что бы результаты возвращались не в виде массива, а в виде хэша
end	


before do #before - выполняется перед выполнением любого запроса
	init_db
end


get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/new' do #добавляем страницу new post
  erb :new #erb - что бы выводилось под нашим шаблоном, new - свзяывает с файлом new.erb
end



#Что бы принять данные формы заполнения
post '/new' do
  #обращаемся к значению textarea в файле new.erb
  content = params[:content] #content - переменная, :content взято из new.erb


  #выводим на экран что написал пользователь в окно заполненияна странице new
  erb "You typed: #{content}" ##{content}" - переменная, показывает написанный текст который был указан в форме для заполнения
end