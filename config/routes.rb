Rails.application.routes.draw do

	get '/index' => 'libraries#index'

	resources :libraries do
		resources :books, :employees, :subscribers
	end

  resources :grants

  get '/books/:book_id/grants' => 'grants#list_by_book', as: 'book_grants'
  get '/subscribers/:subscriber_id/grants' => 'grants#list_by_subscriber', as: 'subscriber_grants'

	root to: "libraries#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

=begin
MacBook-Air-Nikita:bin nikita$ rails routes
                 Prefix Verb   URI Pattern                                           Controller#Action
                  index GET    /index(.:format)                                      libraries#index
          library_books GET    /libraries/:library_id/books(.:format)                books#index
                        POST   /libraries/:library_id/books(.:format)                books#create
       new_library_book GET    /libraries/:library_id/books/new(.:format)            books#new
      edit_library_book GET    /libraries/:library_id/books/:id/edit(.:format)       books#edit
           library_book GET    /libraries/:library_id/books/:id(.:format)            books#show
                        PATCH  /libraries/:library_id/books/:id(.:format)            books#update
                        PUT    /libraries/:library_id/books/:id(.:format)            books#update
                        DELETE /libraries/:library_id/books/:id(.:format)            books#destroy
      library_employees GET    /libraries/:library_id/employees(.:format)            employees#index
                        POST   /libraries/:library_id/employees(.:format)            employees#create
   new_library_employee GET    /libraries/:library_id/employees/new(.:format)        employees#new
  edit_library_employee GET    /libraries/:library_id/employees/:id/edit(.:format)   employees#edit
       library_employee GET    /libraries/:library_id/employees/:id(.:format)        employees#show
                        PATCH  /libraries/:library_id/employees/:id(.:format)        employees#update
                        PUT    /libraries/:library_id/employees/:id(.:format)        employees#update
                        DELETE /libraries/:library_id/employees/:id(.:format)        employees#destroy
    library_subscribers GET    /libraries/:library_id/subscribers(.:format)          subscribers#index
                        POST   /libraries/:library_id/subscribers(.:format)          subscribers#create
 new_library_subscriber GET    /libraries/:library_id/subscribers/new(.:format)      subscribers#new
edit_library_subscriber GET    /libraries/:library_id/subscribers/:id/edit(.:format) subscribers#edit
     library_subscriber GET    /libraries/:library_id/subscribers/:id(.:format)      subscribers#show
                        PATCH  /libraries/:library_id/subscribers/:id(.:format)      subscribers#update
                        PUT    /libraries/:library_id/subscribers/:id(.:format)      subscribers#update
                        DELETE /libraries/:library_id/subscribers/:id(.:format)      subscribers#destroy
              libraries GET    /libraries(.:format)                                  libraries#index
                        POST   /libraries(.:format)                                  libraries#create
            new_library GET    /libraries/new(.:format)                              libraries#new
           edit_library GET    /libraries/:id/edit(.:format)                         libraries#edit
                library GET    /libraries/:id(.:format)                              libraries#show
                        PATCH  /libraries/:id(.:format)                              libraries#update
                        PUT    /libraries/:id(.:format)                              libraries#update
                        DELETE /libraries/:id(.:format)                              libraries#destroy
                 grants GET    /grants(.:format)                                     grants#index
                        POST   /grants(.:format)                                     grants#create
              new_grant GET    /grants/new(.:format)                                 grants#new
             edit_grant GET    /grants/:id/edit(.:format)                            grants#edit
                  grant GET    /grants/:id(.:format)                                 grants#show
                        PATCH  /grants/:id(.:format)                                 grants#update
                        PUT    /grants/:id(.:format)                                 grants#update
                        DELETE /grants/:id(.:format)                                 grants#destroy
                   root GET    /                                                     libraries#index

=end
