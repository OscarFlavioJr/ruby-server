require 'sinatra'
require 'json'

movies = File.readlines('movies.txt').map { |movie| movie.chomp.strip }

set :bind, '0.0.0.0' 
set :port, 4567

get '/recommend' do
  content_type :json
  { recommendation: "Eu recomendo que você assista à: #{movies.sample}." }.to_json
end

post '/command' do
  input = params[:input].downcase.strip

  case input
  when "filme"
    { message: "Eu recomendo que você assista à: #{movies.sample}." }.to_json
  when "sair"
    { message: "Muito obrigado! Tenha um ótimo filme!" }.to_json
  else
    { message: "Não entendi seu comando. Digite 'filme' ou 'sair'" }.to_json
  end
end