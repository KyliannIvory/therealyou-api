-- Dev seed data: fictional salons in Abidjan.
-- Repeatable migration: re-run by Flyway whenever this file changes,
-- so it starts by wiping the tables it fills.

DELETE FROM offering;
DELETE FROM salon;


-- Salons

INSERT INTO salon (id, name, description, city, municipality, neighborhood, location_marker, phone) VALUES
                                                                                                        ('01936a00-0000-7000-8000-000000000001',
                                                                                                         'Belle Tresse Angré',
                                                                                                         'Salon spécialisé dans les tresses : box braids, knotless, nattes collées. Ambiance familiale, rendez-vous conseillé le week-end.',
                                                                                                         'Abidjan', 'Cocody', 'Angré', 'À côté de la pharmacie, en face de l''arrêt de gbaka', '+2250700000001'),

                                                                                                        ('01936a00-0000-7000-8000-000000000002',
                                                                                                         'Le Barbier de la Riviera',
                                                                                                         'Barbershop moderne : coupes, dégradés, taille de barbe et soins homme. Sans rendez-vous en semaine.',
                                                                                                         'Abidjan', 'Cocody', 'Riviera 2', 'Au rez-de-chaussée de l''immeuble bleu, après le supermarché', '+2250500000002'),

                                                                                                        ('01936a00-0000-7000-8000-000000000003',
                                                                                                         'Nappy Queen Niangon',
                                                                                                         'Spécialiste des cheveux naturels et des locks : création, entretien, soins hydratants.',
                                                                                                         'Abidjan', 'Yopougon', 'Niangon', 'Derrière l''école primaire, deuxième rue à gauche', '+2250100000003'),

                                                                                                        ('01936a00-0000-7000-8000-000000000004',
                                                                                                         'Maison Glamour Zone 4',
                                                                                                         'Salon haut de gamme : perruques, tissages, soins profonds et brushing.',
                                                                                                         'Abidjan', 'Marcory', 'Zone 4', 'Dans la galerie commerciale, premier étage', '+2250700000004'),

                                                                                                        ('01936a00-0000-7000-8000-000000000005',
                                                                                                         'Studio Coiffure Abobo-Gare',
                                                                                                         'Salon mixte de quartier : tresses, coupes homme et soins à petits prix.',
                                                                                                         'Abidjan', 'Abobo', 'Abobo-Gare', 'Près du marché, en face de la station de taxis', '+2250500000005');


-- Offerings

INSERT INTO offering (id, name, category, duration_in_minutes, price_xof, salon_id) VALUES
                                                                                        -- Belle Tresse Angré
                                                                                        ('01936a00-0000-7000-9000-000000000101', 'Box braids mi-longues',      'BRAIDS',      300, 20000, '01936a00-0000-7000-8000-000000000001'),
                                                                                        ('01936a00-0000-7000-9000-000000000102', 'Knotless braids longues',    'BRAIDS',      360, 30000, '01936a00-0000-7000-8000-000000000001'),
                                                                                        ('01936a00-0000-7000-9000-000000000103', 'Nattes collées',             'BRAIDS',      120,  8000, '01936a00-0000-7000-8000-000000000001'),
                                                                                        ('01936a00-0000-7000-9000-000000000104', 'Soin hydratant avant tresse','HAIR_CARE',    45,  5000, '01936a00-0000-7000-8000-000000000001'),

                                                                                        -- Le Barbier de la Riviera
                                                                                        ('01936a00-0000-7000-9000-000000000201', 'Coupe classique',            'BARBER',       30,  3000, '01936a00-0000-7000-8000-000000000002'),
                                                                                        ('01936a00-0000-7000-9000-000000000202', 'Dégradé + contours',         'BARBER',       45,  5000, '01936a00-0000-7000-8000-000000000002'),
                                                                                        ('01936a00-0000-7000-9000-000000000203', 'Taille de barbe',            'BARBER',       20,  2000, '01936a00-0000-7000-8000-000000000002'),

                                                                                        -- Nappy Queen Niangon
                                                                                        ('01936a00-0000-7000-9000-000000000301', 'Création de locks',          'LOCKS',       240, 35000, '01936a00-0000-7000-8000-000000000003'),
                                                                                        ('01936a00-0000-7000-9000-000000000302', 'Entretien de locks',         'LOCKS',       120, 12000, '01936a00-0000-7000-8000-000000000003'),
                                                                                        ('01936a00-0000-7000-9000-000000000303', 'Soin profond cheveux crépus','HAIR_CARE',    60,  8000, '01936a00-0000-7000-8000-000000000003'),
                                                                                        ('01936a00-0000-7000-9000-000000000304', 'Twists naturels',            'BRAIDS',      150, 10000, '01936a00-0000-7000-8000-000000000003'),

                                                                                        -- Maison Glamour Zone 4
                                                                                        ('01936a00-0000-7000-9000-000000000401', 'Pose de perruque lace',      'WIGS_WEAVES',  90, 25000, '01936a00-0000-7000-8000-000000000004'),
                                                                                        ('01936a00-0000-7000-9000-000000000402', 'Tissage complet',            'WIGS_WEAVES', 150, 20000, '01936a00-0000-7000-8000-000000000004'),
                                                                                        ('01936a00-0000-7000-9000-000000000403', 'Brushing',                   'HAIR_CARE',    45,  7000, '01936a00-0000-7000-8000-000000000004'),
                                                                                        ('01936a00-0000-7000-9000-000000000404', 'Soin kératine',              'HAIR_CARE',   120, 30000, '01936a00-0000-7000-8000-000000000004'),

                                                                                        -- Studio Coiffure Abobo-Gare
                                                                                        ('01936a00-0000-7000-9000-000000000501', 'Coupe homme',                'BARBER',       25,  1500, '01936a00-0000-7000-8000-000000000005'),
                                                                                        ('01936a00-0000-7000-9000-000000000502', 'Tresses enfant',             'BRAIDS',       90,  4000, '01936a00-0000-7000-8000-000000000005'),
                                                                                        ('01936a00-0000-7000-9000-000000000503', 'Défrisage + mise en plis',   'HAIR_CARE',    75,  6000, '01936a00-0000-7000-8000-000000000005');