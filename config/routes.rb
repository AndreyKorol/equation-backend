Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      scope :equations do
        post 'linear', to: 'equations#linear'
        post 'quadratic', to: 'equations#quadratic'
      end
    end
  end

  match '*path', controller: 'api/v1/api', action: 'cors_preflight_check', via: [:options]
end
