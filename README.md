# Ruby Deep Freezing

This code allows to freeze all elements that are nested inside of the "receiver" object. It has two methods: #deep_freeze and #deep_frozen? which are similar to #freeze and #frozen?. Both methods are embed  in Object class. 
Note: For now this code will not work with related objects (i.g. with "has many" and "belongs to" relationships).
