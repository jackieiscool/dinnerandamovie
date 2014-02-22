DinnerMovieApp::Application.routes.draw do
  get "restaurants", to: "restaurants#index"

  get "home/index"

  root :to => 'home#index'

end
