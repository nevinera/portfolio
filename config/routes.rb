Portfolio::Application.routes.draw do
  match "/galleries/:shortname" => "galleries#show"
  match "/galleries" => "galleries#index"

  root :to => "galleries#splash"
end
