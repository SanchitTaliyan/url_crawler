Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :crawl_pages, only: [:create]
    end
  end
end