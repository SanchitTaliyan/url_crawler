Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'crawl_pages', to: 'crawl_pages#crawl_pages'
      post 'crawl_page', to: 'crawl_pages#crawl_page'
    end
  end
end
