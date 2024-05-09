# Tea Sub API

The Tea Sub API allows customers to create dynamic subscriptions with a price based on the price of items added to the subscription. 

## Getting Started

To set up the Tea Subscription Service API locally, follow these steps:

1. Clone the repository:
   ```git clone git@github.com:SamPuttman/tea_sub.git```

2. Install dependencies:
   ```bundle install```

3. Set up the database:
   ```rails db:{create,migrate}```
   
   If you want seeded test data:
   ```raild db:seed```

5. Start the server:
   ```rails server```

Access the API at http://localhost:5000.

## API Endpoints

### Customers

- GET /api/v1/customers/:id : Retrieve a customer and their subscriptions.

### Subscriptions

- GET /api/v1/customers/:customer_id/subscriptions: Retrieve all subscriptions for a customer.
- Example JSON Response: 
```
{
    "id": 1,
    "first_name": "Ronny",
    "last_name": "Senger",
    "email": "lawerence.witting@gislason.test",
    "address": "Apt. 384 63097 Hagenes Walk, Waiborough, WI 70836",
    "created_at": "2024-05-07T19:51:04.236Z",
    "updated_at": "2024-05-07T19:51:04.236Z",
    "subscriptions": [
        {
            "id": "1",
            "title": "error",
            "status": "active",
            "frequency": "bimonthly",
            "customer_id": 1,
            "created_at": "2024-05-07T19:51:04.271Z",
            "updated_at": "2024-05-07T19:51:04.271Z",
            "price": "100.04",
            "teas": [
                {
                    "id": 11,
                    "title": "Scottish Breakfast",
                    "description": "Natus nisi impedit. Dolor et quos. Officiis porro totam.",
                    "temperature": 93,
                    "brew_time": 6,
                    "price": "2.35",
                    "quantity": 4
                },
            ]
        }
    ]
} 
```

- POST /api/v1/customers/:customer_id/subscriptions: Create a new subscription for a customer.
- Example POST request: 
```
{
  "subscription": {
    "title": "Monthly Tea Subscription 3",
    "status": "active",
    "frequency": 5,
    "subscription_teas_attributes": [
      {
        "tea_id": 1,
        "quantity": 2
      },
      {
        "tea_id": 2,
        "quantity": 3
      }
    ]
  }
}
```
- Example POST Response: 
```
{
    "data": {
        "id": "6",
        "type": "subscription",
        "attributes": {
            "id": 6,
            "title": "Monthly Tea Subscription 3",
            "status": "active",
            "frequency": "every_6_months",
            "customer_id": 1,
            "created_at": "2024-05-09T15:42:53.200Z",
            "updated_at": "2024-05-09T15:42:53.200Z",
            "price": "34.14",
            "teas": [
                {
                    "id": 1,
                    "title": "Lahijan",
                    "description": "Harum ut pariatur. Sint qui dolores. Omnis explicabo ex.",
                    "temperature": 96,
                    "brew_time": 8,
                    "price": "3.87",
                    "quantity": 2
                },
                {
                    "id": 2,
                    "title": "Ujeon",
                    "description": "Unde voluptatem aut. Deleniti hic architecto. Laborum qui libero.",
                    "temperature": 69,
                    "brew_time": 4,
                    "price": "8.80",
                    "quantity": 3
                }
            ]
        }
    }
}

```{
    "data": {
        "id": "6",
        "type": "subscription",
        "attributes": {
            "id": 6,
            "title": "Monthly Tea Subscription 3",
            "status": "active",
            "frequency": "every_6_months",
            "customer_id": 1,
            "created_at": "2024-05-09T15:42:53.200Z",
            "updated_at": "2024-05-09T15:42:53.200Z",
            "price": "34.14",
            "teas": [
                {
                    "id": 1,
                    "title": "Lahijan",
                    "description": "Harum ut pariatur. Sint qui dolores. Omnis explicabo ex.",
                    "temperature": 96,
                    "brew_time": 8,
                    "price": "3.87",
                    "quantity": 2
                },
                {
                    "id": 2,
                    "title": "Ujeon",
                    "description": "Unde voluptatem aut. Deleniti hic architecto. Laborum qui libero.",
                    "temperature": 69,
                    "brew_time": 4,
                    "price": "8.80",
                    "quantity": 3
                }
            ]
        }
    }
}
```
- PUT /api/v1/customers/:customer_id/subscriptions/:id: Update a subscription.
- Example PUT request:
```
{
  "subscription": {
    "title": "Monthly Tea Subscription UPDATED",
    "status": "active",
    "frequency": 5,
    "subscription_teas_attributes": [
      {
        "tea_id": 1,
        "quantity": 2
      },
      {
        "tea_id": 6,
        "quantity": 7
      }
    ]
  }
}
```

- Example Post Response: 

```
{
    "data": {
        "id": "6",
        "type": "subscription",
        "attributes": {
            "id": 6,
            "title": "Monthly Tea Subscription 3 UPDATED",
            "status": "active",
            "frequency": "every_6_months",
            "customer_id": 1,
            "created_at": "2024-05-09T15:42:53.200Z",
            "updated_at": "2024-05-09T15:44:01.272Z",
            "price": "35.88",
            "teas": [
                {
                    "id": 1,
                    "title": "Lahijan",
                    "description": "Harum ut pariatur. Sint qui dolores. Omnis explicabo ex.",
                    "temperature": 96,
                    "brew_time": 8,
                    "price": "3.87",
                    "quantity": 2
                },
                {
                    "id": 6,
                    "title": "Ceylon",
                    "description": "Vel et animi. Dolorem dolorem est. Exercitationem aut eligendi.",
                    "temperature": 74,
                    "brew_time": 1,
                    "price": "4.02",
                    "quantity": 7
                }
            ]
        }
    }
}
```

- DELETE /api/v1/customers/:customer_id/subscriptions/:id: Cancel a customer's subscription.

## Testing

The Tea Subscription Service API includes a full test suite. To run the tests, use the following command:

```bundle exec rspec```

The tests cover both happy and sad paths. There is a fully functional factory for customers and teas for comprehensive testing via Postman or Postico. 

