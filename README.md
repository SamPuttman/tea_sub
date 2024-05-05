# Tea Subscription Service API

The Tea Subscription Service API allows customers to manage their tea subscriptions. It provides endpoints for retrieving customer information, creating, and managing subscriptions.

## Getting Started

To set up the Tea Subscription Service API locally, follow these steps:

1. Clone the repository:
   ```git clone git@github.com:SamPuttman/tea_sub.git```

2. Install dependencies:
   ```bundle install```

3. Set up the database:
   ```rails db:create```
   ```rails db:migrate```

4. Start the server:
   ```rails server```

Access the API at http://localhost:3000.

## API Endpoints

### Customers

- GET /api/v1/customers/:id: Retrieve a customer and their subscriptions.

### Subscriptions

- GET /api/v1/customers/:customer_id/subscriptions: Retrieve all subscriptions for a customer.
- POST /api/v1/customers/:customer_id/subscriptions: Create a new subscription for a customer.
- PUT /api/v1/subscriptions/:id: Update a subscription.
- DELETE /api/v1/customers/:customer_id/subscriptions/:id: Cancel a customer's subscription.

## Testing

The Tea Subscription Service API includes a full test suite. To run the tests, use the following command:

```bundle exec rspec```

The tests cover both happy and sad paths.

