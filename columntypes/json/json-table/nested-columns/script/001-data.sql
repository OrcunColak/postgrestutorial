INSERT INTO orders (order_data) VALUES
('{
  "items": [
    { "name": "Laptop", "price": 1200 },
    { "name": "Mouse", "price": 25 }
  ],
  "customer": { "id": 123, "name": "John Doe" }
}'),
('{
  "items": [
    { "name": "Keyboard", "price": 100 },
    { "name": "Monitor", "price": 300 }
  ],
  "customer": { "id": 456, "name": "Jane Smith" }
}');

INSERT INTO orders (order_data) VALUES
    (
        '{"order": {"items": [
            {"name": "Laptop", "price": 1200, "details": {"warranty": "2 years", "color": "gray"}},
            {"name": "Mouse", "price": 25, "details": {"warranty": "1 year", "color": "black"}}
        ], "customer": {"id": 123, "name": "John Doe"}}}'
    ),
    (
        '{"order": {"items": [
            {"name": "Keyboard", "price": 70, "details": {"warranty": "1 year", "color": "blue"}},
            {"name": "Monitor", "price": 300, "details": {"warranty": "3 years", "color": "black"}}
        ], "customer": {"id": 456, "name": "Jane Smith"}}}'
    ),
    (
        '{"order": {"items": [
            {"name": "Tablet", "price": 400, "details": {"warranty": "2 years", "color": "white"}}
        ], "customer": {"id": 789, "name": "Alice Johnson"}}}'
    );
