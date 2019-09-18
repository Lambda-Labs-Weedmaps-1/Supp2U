# README

#### SUPP2U BACKEND DEPLOYMENT: https://supp2udev.herokuapp.com <br>

#### User Routes
| Method | Endpoint                             | Description                                  |
| ------ | ------------------------------------ | -------------------------------------------- |
| POST   | `/users`                             | Create a user's account.                     |
| GET    | `/users`                             | Returns all users in the database.           |
| GET    | `/users/:id`                         | Returns a user associated with an id.        |
| PUT    | `/users/:id`                         | Modify an existing user.                     |
| DELETE | `/users/:id`                         | Delete an existing user.                     |
| GET    | `/users/:user_id/customers`          | Returns a user's customer info.              |
| POST   | `/users:/user_id/customers`          | Allows a user to create/be a customer.       |
| GET    | `/users/:user_id/businesses`         | Returns a user's business info.              |
| POST   | `/users/:user_id/businesses`         | Allows a user to create/be a business.       |


#### Customer Routes
| Method | Endpoint                             | Description                                  |
| ------ | ------------------------------------ | -------------------------------------------- |
| GET    | `/customers/`                        | Returns all customers in the database.       |
| GET    | `/customers/:id`                     | Returns a customer associated with an id.    |
| PUT    | `/customers/:id`                     | Modify an existing customer.                 |
| DELETE | `/customers/:id`                     | Delete an existing customer.                 |
| GET    | `/customers/:customer_id/carts`      | Returns a customer's active cart.            |
| POST   | `/customers/:customer_id/carts`      | Creates a cart if one is not active.         |
| GET    | `/customers/:customer_id/orders`     | Returns a customer's orders.                 |
| POST   | `/customers/:customer_id/orders`     | Creates an order populated with cart items.  |
| GET    | `/customers/:customer_id/reviews`    | Returns all customer reviews.                |
| POST   | `/customers/:customer_id/reviews`    | Allows a customer to post a review.          |


#### Review Routes
| Method | Endpoint                             | Description                                  |
| ------ | ------------------------------------ | -------------------------------------------- |
| GET    | `/reviews/:id`                       | Returns a review associated with an id.      |
| PUT    | `/reviews/:id`                       | Modify an existing review.                   |
| DELETE | `/reviews/:id`                       | Delete an existing review.                   |


#### Cart Routes
| Method | Endpoint                             | Description                                  |
| ------ | ------------------------------------ | -------------------------------------------- |
| GET    | `/carts/:id`                         | Returns a cart associated with an id.        |
| GET    | `/carts/:id/itemfetch`               | Returns all items assiciated with a cart.    |
| PUT    | `/carts/:id`                         | Modify an existing cart.                     |
| PUT    | `/carts/:id/add`                     | Allows an item to be added to a cart.        |


#### Order Routes
| Method | Endpoint                             | Description                                  |
| ------ | ------------------------------------ | -------------------------------------------- |
| GET    | `/orders`                            | Returns all orders in the database.          |
| GET    | `/orders/:id`                        | Returns an order associated with an id.      |
| PUT    | `/orders/:id`                        | Modify an existing order.                    |
| DELETE | `/orders/:id`                        | Delete an existing order.                    |
| GET    | `/orders/:order_id/orderitems`       | Returns all of the items on an order.        |
| POST   | `/orders/:order_id/orderitems`       | Allows an item to be created for an order.   |
| POST   | `/orders/:id/ship`                   | Allows a pending order to be shipped.        |


#### OrderItem Routes
| Method | Endpoint                             | Description                                  |
| ------ | ------------------------------------ | -------------------------------------------- |
| GET    | `/orderitems`                        | Returns all orderitems in the database.      |
| GET    | `/orderitems/:id`                    | Returns an orderitem associated with an id.  |
| PUT    | `/orderitems/:id`                    | Modify an existing orderitem.                |
| DELETE | `/orderitems/:id`                    | Delete an existing orderitem.                |


#### Business Routes
| Method | Endpoint                             | Description                                  |
| ------ | ------------------------------------ | -------------------------------------------- |
| GET    | `/businesses/`                       | Returns all businesses in the database.      |
| GET    | `/businesses/:id`                    | Returns a business associated with an id     |
| PUT    | `/businesses/:id`                    | Modify an existing business profile.         |
| DELETE | `/businesses/:id`                    | Delete an existing business.                 |
| GET    | `/businesses/:business_id/menus`     | Returns a menu associated with a business.   |
| POST   | `/businesses/:business_id/menus`     | Allows a business to create a menu.          |
| GET    | `/businesses/:business_id/schedules` | Returns a businesses schedule.               |
| POST   | `/businesses/:business_id/schedules` | Allows a business to create a schedule.      |
| GET    | `/businesses/:business_id/reviews`   | Returns the reviews on a business.           | 
| GET    | `/businesses/:business_id/orders`    | Returns the orders placed on a business.     |
| GET    | `/businesses/:id/ratings`            | Returns the total rating for a business.     |


#### Schedules Routes
| Method | Endpoint                             | Description                                  |
| ------ | ------------------------------------ | -------------------------------------------- |
| GET    | `/schedules/:id`                     | Returns a schedule associated with an id     |
| PUT    | `/schedules/:id`                     | Modify an existing schedule.                 |
| DELETE | `/schedules/:id`                     | Delete an existing schedule.                 |


#### Menu Routes
| Method | Endpoint                             | Description                                  |
| ------ | ------------------------------------ | -------------------------------------------- |
| GET    | `/menus/:menu_id/items`              | Returns items associated with a menu.        |
| POST   | `/menus/:menu_id/items`              | Allows items to be posted to a menu.         |
| GET    | `/menus/:id`                         | Returns a menu associated with an id.        |
| PUT    | `/menus/:id`                         | Modify an existing menu.                     |
| DELETE | `/menus/:id`                         | Delete an existing menu.                     |


#### Item Routes
| Method | Endpoint                             | Description                                  |
| ------ | ------------------------------------ | -------------------------------------------- |
| GET    | `/items/:id`                         | Returns an item associated with an id        |
| PUT    | `/items/:id`                         | Modify an existing item.                     |
| DELETE | `/items/:id`                         | Delete an existing item.                     |

# Data Model

![](/datamodel.png)

## Actions

### Users


### Customers

#### index -->
<pre> Finds a user's customer if a user_id is present in the params. Else it finds all users in the database </pre>

#### show -->
<pre>Finds a customer by ID.</pre>

#### create -->
<pre>Adds a new customer to the database. Requires a user_id.</pre>

#### update -->
<pre>Edit an existing customer information by their ID.</pre>

#### destroy -->
<pre>Delete a customer from the database by their ID.</pre>



### Reviews

#### index -->
<pre>If a customer_id is found in the parameters, it returns all of the customer's reviews.
If a business_id is found in the parameters, it returns all of the reviews on a business.</pre>

#### show -->
<pre>Returns a review associated with an ID. </pre>

#### create -->
<pre> Allows a customer to post a review to a business. It also ensures that they can only post one review
      per business. </pre>

#### update -->
<pre>Allows review's to be updated by ID.</pre>

#### destroy -->
<pre>Allows a review to be deleted</pre>



### Carts

#### index -->
<pre>If a valid customer_id is in the params it returns that customer's active cart, else it returns all of the carts in the db.</pre>

#### create -->
<pre>Returns the customer's active cart, or creates a new active cart if they do not have one.</pre>

#### show -->
<pre>Returns a cart based on the provided ID.</pre>

#### add -->
<pre>Add's an item to a cart.</pre>

#### itemfetch -->
<pre>Returns all of the items within a customer's cart.</pre>

#### destroy -->
<pre>Delete an existing cart from the database by its ID. </pre>



### Orders 

#### index -->
<pre>If a customer's ID is present in the params, it returns all of that customer's orders.
If a businesses' ID is present in the params, it returns all of that businesses' orders.
If no Id is present, it returns all orders in the database.</pre>

#### show --> 
<pre>Returns a business by it's ID.</pre>

#### create --> 
<pre>Transforms a customer's cart into an order. It takes all of the items within a customer's cart and creates 
new orderitems for the order aswell.</pre>

#### update --> 
<pre>Update an order's status with its ID.</pre>

#### destroy --> 
<pre>Deletes an order from the database.</pre>

#### ship --> 
<pre>Checks to see if an order meets the criteria required to be shipped off. If so, it is shipped.</pre>



### OrderItems

#### index -->
<pre>If an order_id is present in the params, it returns all of that order's items. Else it returns all of the order_items in the database.</pre>

#### show -->
<pre>Finds an order_item by it's ID.</pre>

#### create --> 
<pre>Creates/adds an order_item to an order. Requires order_id.</pre>

#### update -->
<pre>Edit an existing order_item by its ID.</pre>

#### destroy -->
<pre>Deletes an order_item from the database by ID.</pre>



### Businesses

#### index -->
<pre>Finds a user's business if a user_id is present in the params, else it returns all businesses in the database.</pre>

#### show -->
<pre>Finds a business by its ID.</pre>

#### create -->
<pre>Creates a business for a user. The user_id is required for creation.</pre>

#### update -->
<pre>Edit an existing business by its ID.</pre>

#### destroy -->
<pre>Delete an existing business by its ID.</pre>

#### ratings -->
<pre>Finds a businesses average rating based off of all reviews for that business.</pre>



### Schedules

#### index -->
<pre>Finds a businesses' schedule.</pre>

#### show -->
<pre>Finds a business by its ID.</pre>

#### create -->
<pre>Create/add a schedule to a business. Business_id is required.</pre>

#### update -->
<pre>Edit an existing schedule by it's ID.</pre>

#### destroy -->
<pre>Delete an existing schedule by it's ID.</pre>



### Menus

#### index -->
<pre>Finds a businesses' menu.</pre>

#### show -->
<pre>Finds a menu by its ID.</pre>

#### create -->
<pre>Create/add a menu for a business. Business_id is required.</pre>

#### update -->
<pre>Edit an existing menu by it's ID.</pre>

#### destroy -->
<pre>Delete an existing menu by it's ID.</pre>



### Items

#### index -->
<pre>Finds all items associated with a menu.</pre>

#### show -->
<pre>Finds an item by it's ID.</pre>

#### create --> 
<pre>Creates/adds an item to a menu. Requires order_id.</pre>

#### update -->
<pre>Edit an existing item by its ID.</pre>

#### destroy -->
<pre>Deletes an item from the database by ID.</pre>


## Front-End Documentation

Refer to [Front-End Docs](https://github.com/Lambda-Labs-Weedmaps-1/Supp2U-FE) to view
our Front-End information