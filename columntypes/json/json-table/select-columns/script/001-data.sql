INSERT INTO public.products (id, product_name, data)
 VALUES
  (1, 'iPhone 16', jsonb_build_object(
  'brand', 'Apple',
  'model', '16',
  'release_year', 2024,
  'specifications', jsonb_build_object(
   'screen_size', '6.7 inches',
   'processor', 'Apple A18 Bionic',
   'ram', '8 GB',
   'storage', '256 GB',
   'battery', '4500 mAh',
   'camera', jsonb_build_object(
    'rear', jsonb_build_array(
     jsonb_build_object('type', 'Wide', 'megapixels', 108),
     jsonb_build_object('type', 'Ultra-wide', 'megapixels', 12),
     jsonb_build_object('type', 'Telephoto', 'megapixels', 12)
    ),
    'front', jsonb_build_object('type', 'Wide', 'megapixels', 32)
   )
  ),
  'features', jsonb_build_array(
   '5G capable',
   'Water-resistant (IP68)',
   'Wireless charging',
   'Fast charging support',
   'Face ID',
   'ProMotion 120Hz display'
  ),
  'warranty', '2 years',
  'price', 1199.99
  )),
  (2, 'Macbook Pro 2023', jsonb_build_object(
   'brand', 'Apple',
   'model', 'Pro 2023',
   'release_year', 2023,
   'specifications', jsonb_build_object(
    'screen_size', '15.6 inches',
    'processor', 'M3 pro',
    'ram', '16 GB',
    'storage', '512 GB SSD',
    'graphics_card', 'M3 pro',
    'battery', 'Up to 14 hours'
   ),
   'features', jsonb_build_array(
    'Backlit keyboard',
    'Fingerprint reader',
    'Thunderbolt 4 ports',
    'Retina display'
   ),
   'warranty', '1 year',
   'price', 1499.99
  )),
  (3, 'Sony Headphones Pro', jsonb_build_object(
   'brand', 'AudioSound',
   'model', 'Sony WH-CH720n',
   'release_year', 2021,
   'specifications', jsonb_build_object(
    'connectivity', 'Bluetooth 5.0',
    'battery_life', '35 hours',
    'driver_size', '40mm',
    'weight', '250 grams'
   ),
   'features', jsonb_build_array(
    'Active noise cancellation',
    'Button controls',
    'Voice assistant integration',
    'Water-resistant design'
   ),
   'warranty', '1 year',
   'price', 299.99
  ));