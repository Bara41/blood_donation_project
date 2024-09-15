INSERT INTO public."donor" (full_name, phone_number, blood_group, gender)
VALUES 
('Kirill Lysianski', '099-88-60-20', 'O+', 'Male'),
('Pavlo Dyrov', '099-000-0000', 'A-', 'Male');


INSERT INTO public."blooddonationpoint" (name, phone_number, address)
VALUES 
('Central Blood Bank', '050-123-4567', '777 Khreshchatyk St'),
('North Blood Donation Point', '098-765-4321', '228 Politekhnychna St');


INSERT INTO public."donation" (donation_amount, conversion_date, donor_id, bdp_number)
VALUES 
(800, '13.09.24', 1, 1),
(800, '13.09.24', 2, 2);


INSERT INTO public."hospital" (name, phone_number, address)
VALUES 
('ST Patrik', '123-456-7890', '123 Khreshchatyk St'),
('ST PAVLA', '098-765-4321', '456 Naberezhna St');


INSERT INTO public."hospital_blooddonationpoint" (hospital_number, bdp_number)
VALUES 
(1, 1),
(2, 2);
