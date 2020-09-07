Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admins
  devise_for :customers

	namespace :admin do
	    root "orders#top"  #管理者topページ
	    resources :products, :except => :destroy
	    resources :genres, :only => [:edit, :update, :create, :index]
	    resources :customers, :only => [:edit, :update, :show, :index]
	    resources :ordered_products, :only => :update
	    resources :orders, :only => [:update, :show, :index]
	end

#customer
  root "products#top"   #会員topページ
  get "products/about" => "products#about"  #aboutページ
  get '/customers/:id/withdrow' => 'customers#withdrow', as: 'withdrow_customer' #退会画面
  patch '/customers/:id/withdrow' => 'customers#switch', as: 'withdrow_switch_customer'  #退会処理
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all' #カートを空にする
  post '/orders/confirm' => 'orders#confirm', as: 'orders_confirm'  #購入確認ページ
  get '/orders/thanks' => 'orders#thanks'  #注文完了後のお礼ページ(サンクスページ)
  
  resources :customers, :only => [:show, :edit, :update]
  resources :products, :only => [:show, :index]
  resources :cart_items, :only => [:create, :update, :destroy, :index]
  resources :orders, :only => [:show, :index, :new, :create]
  resources :deliveries, :except => [:show, :new]

end
