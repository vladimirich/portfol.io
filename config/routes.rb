Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do
    root to: 'users#show'
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: 'pages#main'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
