Portfolio::Application.routes.draw do
  match "/galleries/:shortname" => "galleries#show"
  match "/galleries" => "galleries#index"
  match "/rebuild" => "galleries#rebuild", :via => :get
  match "/rebuild" => "galleries#fetch", :via => :post
  match "/setup" => "galleries#setup", :via => :get
  match "/setup" => "galleries#write_settings", :via => :post

  root :to => "galleries#splash"
end
