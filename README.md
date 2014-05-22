mvcgui
======

Manage your MVC apps via web GUI

Well, this is still where you'd have to use this rails app to use mvcgui, but within that it minimally works

To install, clone the repo, run bundle install, run rake db:migrate, run rake db:data:load, and you should see what I see.

Next steps are to start making things easier. 

We need a generator that kicks off when a model is created, along with tools to automatically create model-displays, fields, field-displays, and data_display records. One should be able to run these scripts and have them only do the needed steps when parts of a model are already in place.. to fix em. .. as well as to build complete 'Models'. 

Also, it'd be nice to be able to see lists of model_displays and fields when you are show a single model record.


