Rails.application.routes.draw do
  root 'home#index'

  get '/inicio/:group_id',  to: 'groups#new',    as: 'start'
  get '/proximo/:type',     to: 'groups#create', as: 'create'

  get '/grupos',              to: 'groups#index',     as: 'index'
  get '/detalhes/:group_id',  to: 'groups#show',      as: 'show'
  get '/usuario/:user_id',    to: 'groups#user_show', as: 'user_show'
end
