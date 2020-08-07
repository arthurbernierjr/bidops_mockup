Rails.application.routes.draw do
  resources :item_attribute_ledgers
  resources :item_data_property_ledgers
  resources :category_item_ledgers
  resources :data_attributes
  resources :data_properties
  resources :categories
  resources :items do
    get :allData
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
