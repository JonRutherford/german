GermanLernen::Application.routes.draw do
  root to: "static_pages#home"

  resources :quizzes, only: :index
  match 'quizzes/random_sentence', to: 'quizzes#random_sentence', as: 'random_sentence_quiz'
  match 'quizzes/random_noun', to: 'quizzes#random_noun', as: 'random_noun_quiz'

  resources :sentences, except: :new #, only: [:index, :edit, :update, :destroy, :create]
  resources :nouns
end
