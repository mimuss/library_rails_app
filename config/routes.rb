Rails.application.routes.draw do

	get '/index' => 'libraries#index'

	resources :libraries do
		resources :books do
      resources :grants, only: [:index, :new, :create, :destroy, :edit, :update]
    end
	end

  resources :libraries do
    resources :subscribers do 
      resources :grants, only: [:index, :new, :create, :destroy, :edit, :update]
    end
  end

  resources :libraries do
    resources :employees
  end

  resources :reports, only: [:index]
  resources :books, only: [:new, :create]
  resources :employees, only: [:new, :create]
  root to: "libraries#index"

  get '/all_employees' => 'employees#all_employees', as: 'all_employees'

  get '/all_books' => 'books#all_books', as: 'all_books'

  get '/reports/ajax' => 'reports#ajax', as: 'reports_ajax'

end


=begin
MacBook-Air-Nikita:bin nikita$ rails routes
                       Prefix Verb   URI Pattern                                                                 Controller#Action
                        index GET    /index(.:format)                                                            libraries#index
          library_book_grants GET    /libraries/:library_id/books/:book_id/grants(.:format)                      grants#index
                              POST   /libraries/:library_id/books/:book_id/grants(.:format)                      grants#create
       new_library_book_grant GET    /libraries/:library_id/books/:book_id/grants/new(.:format)                  grants#new
      edit_library_book_grant GET    /libraries/:library_id/books/:book_id/grants/:id/edit(.:format)             grants#edit
           library_book_grant PATCH  /libraries/:library_id/books/:book_id/grants/:id(.:format)                  grants#update
                              PUT    /libraries/:library_id/books/:book_id/grants/:id(.:format)                  grants#update
                              DELETE /libraries/:library_id/books/:book_id/grants/:id(.:format)                  grants#destroy
                library_books GET    /libraries/:library_id/books(.:format)                                      books#index
                              POST   /libraries/:library_id/books(.:format)                                      books#create
             new_library_book GET    /libraries/:library_id/books/new(.:format)                                  books#new
            edit_library_book GET    /libraries/:library_id/books/:id/edit(.:format)                             books#edit
                 library_book GET    /libraries/:library_id/books/:id(.:format)                                  books#show
                              PATCH  /libraries/:library_id/books/:id(.:format)                                  books#update
                              PUT    /libraries/:library_id/books/:id(.:format)                                  books#update
                              DELETE /libraries/:library_id/books/:id(.:format)                                  books#destroy
                    libraries GET    /libraries(.:format)                                                        libraries#index
                              POST   /libraries(.:format)                                                        libraries#create
                  new_library GET    /libraries/new(.:format)                                                    libraries#new
                 edit_library GET    /libraries/:id/edit(.:format)                                               libraries#edit
                      library GET    /libraries/:id(.:format)                                                    libraries#show
                              PATCH  /libraries/:id(.:format)                                                    libraries#update
                              PUT    /libraries/:id(.:format)                                                    libraries#update
                              DELETE /libraries/:id(.:format)                                                    libraries#destroy
    library_subscriber_grants GET    /libraries/:library_id/subscribers/:subscriber_id/grants(.:format)          grants#index
                              POST   /libraries/:library_id/subscribers/:subscriber_id/grants(.:format)          grants#create
 new_library_subscriber_grant GET    /libraries/:library_id/subscribers/:subscriber_id/grants/new(.:format)      grants#new
edit_library_subscriber_grant GET    /libraries/:library_id/subscribers/:subscriber_id/grants/:id/edit(.:format) grants#edit
     library_subscriber_grant PATCH  /libraries/:library_id/subscribers/:subscriber_id/grants/:id(.:format)      grants#update
                              PUT    /libraries/:library_id/subscribers/:subscriber_id/grants/:id(.:format)      grants#update
                              DELETE /libraries/:library_id/subscribers/:subscriber_id/grants/:id(.:format)      grants#destroy
          library_subscribers GET    /libraries/:library_id/subscribers(.:format)                                subscribers#index
                              POST   /libraries/:library_id/subscribers(.:format)                                subscribers#create
       new_library_subscriber GET    /libraries/:library_id/subscribers/new(.:format)                            subscribers#new
      edit_library_subscriber GET    /libraries/:library_id/subscribers/:id/edit(.:format)                       subscribers#edit
           library_subscriber GET    /libraries/:library_id/subscribers/:id(.:format)                            subscribers#show
                              PATCH  /libraries/:library_id/subscribers/:id(.:format)                            subscribers#update
                              PUT    /libraries/:library_id/subscribers/:id(.:format)                            subscribers#update
                              DELETE /libraries/:library_id/subscribers/:id(.:format)                            subscribers#destroy
                              GET    /libraries(.:format)                                                        libraries#index
                              POST   /libraries(.:format)                                                        libraries#create
                              GET    /libraries/new(.:format)                                                    libraries#new
                              GET    /libraries/:id/edit(.:format)                                               libraries#edit
                              GET    /libraries/:id(.:format)                                                    libraries#show
                              PATCH  /libraries/:id(.:format)                                                    libraries#update
                              PUT    /libraries/:id(.:format)                                                    libraries#update
                              DELETE /libraries/:id(.:format)                                                    libraries#destroy
            library_employees GET    /libraries/:library_id/employees(.:format)                                  employees#index
                              POST   /libraries/:library_id/employees(.:format)                                  employees#create
         new_library_employee GET    /libraries/:library_id/employees/new(.:format)                              employees#new
        edit_library_employee GET    /libraries/:library_id/employees/:id/edit(.:format)                         employees#edit
             library_employee GET    /libraries/:library_id/employees/:id(.:format)                              employees#show
                              PATCH  /libraries/:library_id/employees/:id(.:format)                              employees#update
                              PUT    /libraries/:library_id/employees/:id(.:format)                              employees#update
                              DELETE /libraries/:library_id/employees/:id(.:format)                              employees#destroy
                              GET    /libraries(.:format)                                                        libraries#index
                              POST   /libraries(.:format)                                                        libraries#create
                              GET    /libraries/new(.:format)                                                    libraries#new
                              GET    /libraries/:id/edit(.:format)                                               libraries#edit
                              GET    /libraries/:id(.:format)                                                    libraries#show
                              PATCH  /libraries/:id(.:format)                                                    libraries#update
                              PUT    /libraries/:id(.:format)                                                    libraries#update
                              DELETE /libraries/:id(.:format)                                                    libraries#destroy
                         root GET    /                                                                           libraries#index
                all_employees GET    /all_employees(.:format)                                                    employees#all_employees


=end

=begin
  get '/books/:book_id/grants' => 'grants#index', as: 'book_grants_index'
  get '/subscribers/:subscriber_id/grants' => 'grants#index', as: 'subscriber_grants_index'

  get '/books/:book_id/grants/new' => 'grants#new', as: 'new_book_grant'
  get '/book/:book_id/gants/new' => 'grants#create', as: 'book_grants'

  get '/subscribers/:subscriber_id/grants/new' => 'grants#new', as: 'new_subscriber_grant'
  get '/subscriber/:subscriber_id/gants/new' => 'grants#create', as: 'subscriber_grants'


  get '/all_employees' => 'employees#all_employees', as: 'all_employees'

  root to: "libraries#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
=end
