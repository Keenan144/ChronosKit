Rails.application.routes.draw do
   root             'static_pages#home'

  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'fake_barcodes' => 'static_pages#fake'
  get 'generate_barcodes' => 'barcodes#generate'
  post 'fake_barcodes' => 'barcodes#fake'
  get 'generate_barcodes' => 'barcodes#generate'

  resources :barcodes
  resources :amounts
end
