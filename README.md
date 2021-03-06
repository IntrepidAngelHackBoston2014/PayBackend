Pay-backend
===========

Deploy
-------

git push staging master -f

Drop Remote DB
--------------

heroku pg:reset DATABASE --remote staging

Note! Will be asked to confirm to drop database.

Push DB
-------

heroku pg:push pay-backend_development DATABASE --remote staging

Restart
--------

heroku restart --remote staging

Places
-------

Leaf HQ = [42.366938, -71.0778098]
SF = [37.7958343, -122.3940353]
Seattle = [47.6094497, -122.3418]

Getting Started
---------------

After setting up, you can run the application using [foreman]:

    % foreman start

Endpoints
---------

List of Retailers

BitCoin w/in 3 miles of Leaf

http://pay-backend-staging.herokuapp.com/retailers.json?codes=coin&distance=3

BitPay w/in 3 miles of Leaf

http://pay-backend-staging.herokuapp.com/retailers.json?codes=bpay&distance=3

LevelUp w/in 1 mile of Leaf

http://pay-backend-staging.herokuapp.com/retailers.json?codes=lvup

Starbucks w/in 1 mile of Leaf HQ

http://pay-backend-staging.herokuapp.com/retailers.json?codes=sbux

Dunkin Donuts and Cumberland Farms w/in 2 mile box of Leaf HQ

http://pay-backend-staging.herokuapp.com/retailers.json?codes=cfrm,dnkn&distance=2

Starbucks w/in 1 mile of Seattle

http://pay-backend-staging.herokuapp.com/retailers.json?codes=sbux&distance=1&lat=47.6094497&lon=-122.3418

PayPal near Intrpeid

http://pay-backend-staging.herokuapp.com/retailers.json?codes=ppal
