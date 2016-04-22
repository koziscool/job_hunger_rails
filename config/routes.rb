Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  match 'create_from_chrome' => 'jobs#create_from_chrome', via: :post

  jsonapi_resources :users
  jsonapi_resources :companies
  jsonapi_resources :leads
  jsonapi_resources :jobs
  jsonapi_resources :recommendations
end
