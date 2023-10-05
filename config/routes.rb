Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :end_users, controllers: {
    registrations: 'end_user/registrations'
    #sessions: 'end_user/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'end_user/homes#top'
  get '/about' => 'end_user/homes#about', as: 'about'


end
