Rails.application.routes.draw do
  # マイページ
  namespace :end_user do
    get 'members/mypage' => "members#mypage", as:'member'
    get 'members/edit'  =>  "members#edit", as: 'member_edit'
    patch 'members/mypage' => "members#update", as: 'member_update'
    get 'members/check' => "members#check", as: 'member_check'
    #patch 'members/is_withdraw'
  end

  # ロッカーの情報を新規投稿するためのもの
  resources :facilities do
    # 投稿されたロッカー情報に対して追記するためのもの
    resources :post_scripts do
      # 追記投稿されたものに対していいね機能を実装
      resource :favorites, only: [:create, :destroy]
      # 追記投稿についてのコメント機能とのアソシエーション
      resources :post_script_comments, only: [:create, :destroy]
    end
  end
  get 'search', to: 'searches#search', as: 'search'

  devise_for :end_users, controllers: {
    registrations: 'end_user/registrations',
    sessions: 'end_user/sessions'
  }

  devise_scope :end_user do
    post 'end_users/guest_sign_in', to: 'end_user/sessions#guest_sign_in'
  end

    devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'end_user/homes#top'
  get '/about' => 'end_user/homes#about', as: 'about'


end
