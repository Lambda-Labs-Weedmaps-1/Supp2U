# README

#### SUPP2U BACKEND DEPLOYMENT: https://supp2udev.herokuapp.com <br>

#### Ruby Version
Ruby Version 2.5.0

#### Database Configuration/Deployment
The database was configured and created using postgres and was deployed through Heroku.


#### To Run Tests....
Rspec was used for testing. 
The command to run all of the tests at once is -> rspec
The command for running a testing file is -> rspec _pathtofile_

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
| DELETE | `/carts/:id`                         | Delete an existing cart.                     |
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

#### Users

---

```
{
    id: INTEGER
    email: STRING
    password: STRING
    wallet: STRING
    is_admin: STRING

}
```

#### Customers

---

```
{
    id: INTEGER
    user_id: INTEGER
    custname: STRING
    stripe_token: STRING
    stripe_email: STRING
}
```

#### Review

---

```
{
    id: INTEGER
    customer_id: INTEGER
    business_id: INTEGER
    review: STRING
    rating: FLOAT
}
```

#### Carts

---

```
{
    id: INTEGER
    customer_id: INTEGER
    business_id: INTEGER
    active: BOOLEAN
    item_numbers: INTEGER(ARRAY)
    quantity: INTEGER
}
```

#### Orders

---

```
{
    id: INTEGER
    customer_id: INTEGER
    business_id: INTEGER
    cart_id: INTEGER
    status: STRING

}
```

#### OrderItems

---

```
{
    id: INTEGER
    order_id: INTEGER
    item_id: INTEGER
    item_name: STRING
    price: FLOAT
}
```

#### Businesses

---

```
{
    id: INTEGER
    user_id: INTEGER
    name: STRING
    website: STRING
    city: STRING
    state: STRING
    street: STRING
    zipcode: INTEGER
    building_number: INTEGER
    theme: STRING
    description: STRING
    recommended: BOOLEAN
    long: STRING
    lat: STRING
    stripe_token: STRING
    stripe_email: STRING

}
```

#### Schedules

---

```
{
    id: INTEGER
    business_id: INTEGER
    sunday: STRING
    monday: STRING
    tuesday: STRING
    wednesday: STRING
    thursday: STRING
    friday: STRING
    saturday: STRING
}
```

#### Menus

---

```
{
    id: INTEGER
    business_id: INTEGER
    name: STRING
}
```

#### Items

---

```
{
    id: INTEGER
    menu_id: INTEGER
    item_name: STRING
    price: FLOAT
    inventory: INTEGER
    category: STRING
    description: STRING
    cals: INTEGER
}
```

## Actions

### AUTH

#### login -->
<pre>Finds a user by their email. If the user doesn't exist, it creates one. If a user does exist it checks to see if the user is a customer or a business and then logs them in accordingly.</pre>



### CHARGES

#### create --> 
<pre> Handles transaction creation between customers and businesses utilizing a custom stripe_charge_service that essentially retrieves a businesses' stripe information (or creates it if it doesn't yet exist),retrieves a customer's stripe information (or creates it if it doesn't exist) and then creates a linked charge/transaction between the two parties. </pre>



### SEARCH

#### search -->
<pre> Find businesses by theme or items </pre>


### Users

#### index -->
<pre> Finds all user's in the database.</pre>

#### show -->
<pre>Finds a user by ID.</pre>

#### update -->
<pre>Edit an existing user's information by their ID.</pre>

#### destroy -->
<pre>Delete an existing user from the database by their ID.</pre>


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
<pre>Allows reviews to be updated by ID.</pre>

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
<pre>Adds an item to a cart.</pre>

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
new order_items for the order as well.</pre>

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

## Services

### OrderProcessor

```
The order_processor takes in an order and initializes with that order and the items belonging to that order.

It has a private method that check an order_item against the item in the database to make sure that there is sufficient inventory. It returns a true or false boolean value.

It also has a "ship" method which uses the private "items_available?" method to insure that the order can be shipped. It then reduces the inventory of each item in the database and ships the order provided that it is a pending order with items.
```

### ImageUploader
```
The image_uploader is/can be initialized with any model instance that can have an attached image and with the params for it. 

It has two private methods. One (file?) which checks to see if there is already an attached image. And another (delete_image), which can remove an attached image.

It also has a "call" method which checks to see if an image is being sent through the params and if there is already an attached image. If so it removes the old attached image and updates it with the new one. If there isn't an attached image, it just adds one, if provided.
```

### StripeChargesService

See Charges action for generalized description of this service.

---
Private Methods:

`find_business` --> Finds a businesses stripe information or creates it if it doesn't exist.
`retrieve_business` --> Retrieves a businesses stripe account using their stripe_token.
`create_business` --> Creates a businesses stripe account and adds the stripe_token to the database. 
                      Sends terms of service agreement to stripe.

`find_customer` -->  Finds a customer's stripe information or creates it if it does not exist.
`retrieve_customer` --> Retrieves a customer's stripe account using their stripe_token.
`create_customer` --> Creates a customer's stripe account and adds the stripe_token to the database.
`create_charge` --> Creates a charge to the customer's account.

Public Methods:
`call` --> Uses the private method "create_charge" on a customer.
`buscall` --> Uses the private method "find_business".

---



## Front-End Documentation

Refer to [Front-End Docs](https://github.com/Lambda-Labs-Weedmaps-1/Supp2U-FE) to view
our Front-End information