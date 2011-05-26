Portfolio::Application.routes.draw do
  match "/galleries/:shortname" => "galleries#show"
  match "/galleries" => "galleries#index"
  match "/rebuild" => "owners#rebuild", :via => :get
  match "/rebuild" => "owners#fetch", :via => :post

  root :to => "galleries#splash"
end
