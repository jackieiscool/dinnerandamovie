DinnerMovieApp::Application.routes.draw do
  get "restaurants/:departure", to: "restaurants#index"

  get "home/index"

  root :to => 'home#index'

end
