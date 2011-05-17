Portfolio::Application.routes.draw do
  match "/galleries/:shortname" => "galleries#show"
  match "/galleries" => "galleries#index"
  match "/owners/:id/refresh" => "owners#refresh"
  root :to => "galleries#splash"
end
