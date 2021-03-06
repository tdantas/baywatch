[![Build Status](https://travis-ci.org/tdantas/baywatch.svg)](https://travis-ci.org/tdantas/baywatch)

# Baywatch

## Installation

Add this line to your application's Gemfile:

    gem 'baywatch'

And then execute:

    $ bundle

## Usage

Declarative way to error handling inside controller

````

  class UsersController < ApplicationController
    include Baywatch::Rescue

    # By default will handle([ Errno::ECONNREFUSED, Errno::ECONNRESET ])
    service_down do |on|      
      on.index do
        flash[:error] = "Sorry, the service is not working properly"
      end
      on.create do 
        flash[:error] = "Sorry, we cannot save right now"
        flash.keep(:error)
        redirect root_url
      end
    end
    
    def index
      @users = UserRemoteService.all
    end
    
    def create
      UserRemoteService.create(params[:user])
    end
    
  end
  
````

Using #only to use the same behavior to many actions.


````

  class UserController < ApplicationController
    include Baywatch::Rescue

    service_down do |on|      
      on.only :index, :create do
        flash[:error] = "Sorry, the service is not working properly"
        redirect_to root_url
      end
    end
    
    def index
      @users = UserRemoteService.all
    end
    
    def create
      UserRemoteService.create(params[:user])
    end
    
  end
  
````


### TODO

##### Handle Contextual Exception
 
 ```
  service_down do |on|
  
    on.edit(ActiveRecord::RecordNotFound)
      flash[:error] = "Not Found"
      redirect_to root_url
    end
    
    on.edit(Base::WhateverException)
      flash[:error] = "Whatever Message Here"
      MailAdministrator.send(:fail")
      redirect_to root_url
    end
  end
 ```
 
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Cover with tests
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`) 
6. Create new Pull Request
