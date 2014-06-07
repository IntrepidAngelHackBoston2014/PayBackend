Pay-backend
===========

Deploy
-------

git push staging master -f

Drop Remote DB
--------------

heroku pg:reset DATABASE

Push DB
-------

heroku pg:push pay-backend_development DATABASE --remote staging


Getting Started
---------------

After setting up, you can run the application using [foreman]:

    % foreman start


