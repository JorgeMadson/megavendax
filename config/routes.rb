Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'ingressos#index', as: 'home'
#Exemplo de rota normal
#get 'sobre' => ingressos#sobre

#Exemplo de rota de resources 
resources :ingressos
resources :pedidos
#Cada comprador só pode comprar UM ingresso
resources :compradores
end
