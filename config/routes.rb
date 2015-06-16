Rails.application.routes.draw do
   root             'static_pages#home'

  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'fake_barcodes' => 'static_pages#fake'
  get 'generate_barcodes' => 'barcodes#generate'
  get 'generate_barcodes' => 'barcodes#generate'
  get 'search' => 'barcodes#search'
  get 'help' => 'static_pages#help'
  get 'reset' => 'static_pages#reset'
  get 'feedback' => 'static_pages#feedback'
  post 'search' => 'barcodes#search'
  post 'search_last' => 'barcodes#last'
  post 'fake_barcodes' => 'barcodes#fake'

  resources :barcodes
  resources :amounts
end
