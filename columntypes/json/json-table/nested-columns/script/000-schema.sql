CREATE TABLE IF NOT EXISTS public.orders (
  id serial PRIMARY KEY,
  order_data JSONB
 );