Rails.application.routes.draw do
# 施設の情報を新規投稿するためのモデル
  # get 'facilities/index'
  # get 'facilities/show'
  # get 'facilities/new'
  # get 'facilities/create'
  # get 'facilities/edit'
  # get 'facilities/update'
  # get 'facilities/destroy'

  namespace :end_user do
    get 'members/mypage' => "members#mypage", as:'member'
    get 'members/edit'  =>  "members#edit", as: 'member_edit'
    patch 'members/information' => "members#update", as: 'member_update'
    get 'members/check' => "members#check", as: 'member_check'
    #patch 'members/is_withdraw'
  end

  devise_for :end_users, controllers: {
    registrations: 'end_user/registrations',
    sessions: 'end_user/sessions'
  }

    devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'end_user/homes#top'
  get '/about' => 'end_user/homes#about', as: 'about'


end
