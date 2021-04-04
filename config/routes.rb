# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :emails, only: :create do
      get '/track/:email_unique_id', on: :collection, action: 'track', as: 'track'
    end
  end
end
