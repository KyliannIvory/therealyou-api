INSERT INTO salon (
    id,
    name,
    description,
    city,
    municipality,
    neighborhood,
    location_marker,
    phone
) VALUES
      (
          '11111111-1111-4111-8111-111111111111',
          'Atelier Naya',
          'Salon spécialisé dans les tresses et les soins capillaires.',
          'Abidjan',
          'Cocody',
          'Angré',
          'Angré, près du nouveau CHU',
          '+2250701020304'
      ),
      (
          '22222222-2222-4222-8222-222222222222',
          'Barber Studio',
          'Espace dédié aux coupes homme et à l''entretien de la barbe.',
          'Abidjan',
          'Marcory',
          'Zone 4',
          'Zone 4, rue du Canal',
          '+2250506070809'
      );

INSERT INTO offering (
    id,
    name,
    category,
    duration_in_minutes,
    price_xof,
    salon_id
) VALUES
      (
          'aaaaaaaa-aaaa-4aaa-8aaa-aaaaaaaaaaaa',
          'Box braids',
          'BRAIDS',
          240,
          25000,
          '11111111-1111-4111-8111-111111111111'
      ),
      (
          'bbbbbbbb-bbbb-4bbb-8bbb-bbbbbbbbbbbb',
          'Soin hydratant',
          'HAIR_CARE',
          60,
          10000,
          '11111111-1111-4111-8111-111111111111'
      ),
      (
          'cccccccc-cccc-4ccc-8ccc-cccccccccccc',
          'Coupe classique',
          'BARBER',
          45,
          5000,
          '22222222-2222-4222-8222-222222222222'
      );
