Portfolio::Application.routes.draw do
  match "/galleries/:shortname" => "galleries#show"
  match "/galleries" => "galleries#index"
  match "/rebuild" => "owners#rebuild"

  root :to => "galleries#splash"
end
