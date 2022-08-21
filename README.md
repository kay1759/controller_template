# Rails Controller Template

This describes 'Rails Controller Template' to reduce code foc controller.<br />
This is not a standard Rails way, but hope you will get some hints for ruby application.

## developing step

This repository has 3 branch for those steps below.<br />

### step 0 (standard Rails way)
saved to git branch **rails-way**<br />
* create new project and then,<br />
  rails generate scaffold Blog name:string title:string content:text<br />
  rails generate scaffold Person name:string email:string age:integer<br />
  rails generate scaffold BlogPost blog_id:integer name:string title:string content:text<br />

* update models to add validates and relations for Blog and BlogPost.<br />

* setup rspec test<br />

### stage 1 (change instance variable name)
saved to git branch **instance-variable**<br />
* update controllers.<br />example for blogs_controller,<br />
    @blog -> @resource<br />
	@blogs -> @resources<br />
	blog_params ->  resource_params<br />

* update files in app/views and spec/views

### stage 2 (implement controller template)
saved to git branch **main**<br />
* create resources_controller.rb and update controllers to inherit it<br />

### bug fix (not main theme for this)

* the Destory links of all 3 index views do not work.

* fix the bug after implements 'Rails Controller Template'.

## Environment:
Latest environment is as below.

* Arch Linux version 5.19.2-arch1-1
* ruby 3.0.2p20
* Rails 7.0.3.1


Programing environment is as below.

* Ubuntu 18.04.1 LTS x86_64
* ruby 2.7.1p83
* Rails 6.0.3.2



## Application Installation Instructions:
    git clone git@github.com:kay1759/controller_template.git
    cd controller_template
	bundle install --path vendor/bundle
    bundle exec rake db:migrate

you can use this account or register another account as you like.

## Operating Instructions:

### Usage:

    bundle exec rails server -b 0.0.0.0

    connet with browzer


### Valid URL
    /people
    /blogs
    /blog_posts


## Test

    bundle exec rspec

## Licence:

[MIT]

## Author

[Katsuyoshi Yabe](https://github.com/kay1759)
