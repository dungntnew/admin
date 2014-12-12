Admin::Engine.routes.draw do
  get 'debugger/index'
  root to: 'debugger#index'
end
