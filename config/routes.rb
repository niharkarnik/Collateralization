Rails.application.routes.draw do
  get 'initsourcecollateral/index'

  get 'welcome/index'

#  get 'sources/index'
  resources :articles
  resources :sources do
    resources :allocsources
  end
  resources :collaterals
  resources :allocsources
  resources :vavailablecollaterals
  resources :vunderallocatedsources
  resources :comparerules
  resources :attemptallocations

  root 'welcome#index'
#  root 'sources#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
