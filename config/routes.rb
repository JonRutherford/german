GermanLernen::Application.routes.draw do
  root to: "sessions#new"

  resources :quizzes, only: [:index]
  match 'quizzes/der_die_das', to: 'quizzes#der_die_das'#, as: 'der_die_das_quiz'
  match 'quizzes/translate_noun', to: 'quizzes#translate_noun'#, as: 'translate_noun_quiz'
  match 'quizzes/pluralise', to: 'quizzes#pluralise'
  #match 'quizzes/random_sentence', to: 'quizzes#random_sentence', as: 'random_sentence_quiz'
  

  #resources :sentences, except: :new #, only: [:index, :edit, :update, :destroy, :create]
  resources :verbs, except: [:edit]
  resources :nouns, except: [:edit]
  resources :users
  resources :password_resets, except: [:show, :delete]
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
end
