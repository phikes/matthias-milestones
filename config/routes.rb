Rails.application.routes.draw do
  resources :milestones
  root "milestones#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
