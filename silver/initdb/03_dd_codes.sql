-- Inserts para a tabela accident_severity
INSERT INTO accident_severity (code, description) VALUES
(1, 'Fatal'),
(2, 'Serious'),
(3, 'Slight');

-- Inserts para a tabela age_band
INSERT INTO age_band (code, description) VALUES
(-1, 'Unknown'),
(1, '0 - 5'),
(2, '6 - 10'),
(3, '11 - 15'),
(4, '16 - 20'),
(5, '21 - 25'),
(6, '26 - 35'),
(7, '36 - 45'),
(8, '46 - 55'),
(9, '56 - 65'),
(10, '66 - 75'),
(11, 'Over 75');

-- Inserts para a tabela bus_or_coach
INSERT INTO bus_or_coach (code, description) VALUES
(1, 'Boarding'),
(2, 'Alighting'),
(3, 'Standing passenger'),
(4, 'Seated passenger'),
(9, 'unknown (self reported)'),
(-1, 'Data missing or out of range');

-- Inserts para a tabela car_passenger
INSERT INTO car_passenger (code, description) VALUES
(0, 'Not car passenger'),
(1, 'Front seat passenger'),
(2, 'Rear seat passenger'),
(9, 'unknown (self reported)'),
(-1, 'Data missing or out of range');

-- Inserts para a tabela carriageway_hazard
INSERT INTO carriageway_hazard (code, description) VALUES
(0, 'None'),
(1, 'Vehicle load on road'),
(2, 'Other object on road'),
(3, 'Previous accident'),
(4, 'Dog on road'),
(5, 'Other animal on road'),
(6, 'Pedestrian in carriageway - not injured'),
(7, 'Any animal in carriageway (except ridden horse)'),
(-1, 'Data missing or out of range'),
(9, 'unknown (self reported)');

-- Inserts para a tabela casualty_class
INSERT INTO casualty_class (code, description) VALUES
(1, 'Driver or rider'),
(2, 'Passenger'),
(3, 'Pedestrian');

-- Inserts para a tabela casualty_severity
INSERT INTO casualty_severity (code, description) VALUES
(1, 'Fatal'),
(2, 'Serious'),
(3, 'Slight');

-- Inserts para a tabela casualty_type
INSERT INTO casualty_type (code, description) VALUES
(0, 'Pedestrian'),
(1, 'Cyclist'),
(2, 'Motorcycle 50cc and under rider or passenger'),
(3, 'Motorcycle 125cc and under rider or passenger'),
(4, 'Motorcycle over 125cc and up to 500cc rider or passenger'),
(5, 'Motorcycle over 500cc rider or passenger'),
(8, 'Taxi/Private hire car occupant'),
(9, 'Car occupant'),
(10, 'Minibus (8 - 16 passenger seats) occupant'),
(11, 'Bus or coach occupant (17 or more pass seats)'),
(16, 'Horse rider'),
(17, 'Agricultural vehicle occupant'),
(18, 'Tram occupant'),
(19, 'Van / Goods vehicle (3.5 tonnes mgw or under) occupant'),
(20, 'Goods vehicle (over 3.5t. and under 7.5t.) occupant'),
(21, 'Goods vehicle (7.5 tonnes mgw and over) occupant'),
(22, 'Mobility scooter rider'),
(23, 'Electric motorcycle rider or passenger'),
(90, 'Other vehicle occupant'),
(97, 'Motorcycle - unknown cc rider or passenger'),
(98, 'Goods vehicle (unknown weight) occupant');

-- Inserts para a tabela day_of_week
INSERT INTO day_of_week (code, description) VALUES
(1, 'Sunday'),
(2, 'Monday'),
(3, 'Tuesday'),
(4, 'Wednesday'),
(5, 'Thursday'),
(6, 'Friday'),
(7, 'Saturday');

-- Inserts para a tabela junction_control
INSERT INTO junction_control (code, description) VALUES
(0, 'Not at junction or within 20 metres'),
(1, 'Authorised person'),
(2, 'Auto traffic signal'),
(3, 'Stop sign'),
(4, 'Give way or uncontrolled'),
(-1, 'Data missing or out of range');

-- Inserts para a tabela junction_detail
INSERT INTO junction_detail (code, description) VALUES
(0, 'Not at junction or within 20 metres'),
(1, 'Roundabout'),
(2, 'Mini-roundabout'),
(3, 'T or staggered junction'),
(5, 'Slip road'),
(6, 'Crossroads'),
(7, 'More than 4 arms (not roundabout)'),
(8, 'Private drive or entrance'),
(9, 'Other junction'),
(-1, 'Data missing or out of range');

-- Inserts para a tabela light_conditions
INSERT INTO light_conditions (code, description) VALUES
(1, 'Daylight'),
(4, 'Darkness - lights lit'),
(5, 'Darkness - lights unlit'),
(6, 'Darkness - no lighting'),
(7, 'Darkness - lighting unknown'),
(-1, 'Data missing or out of range');

-- Inserts para a tabela ped_cross_physical
INSERT INTO ped_cross_physical (code, description) VALUES
(0, 'No physical crossing facilities within 50 metres'),
(1, 'Zebra'),
(4, 'Pelican, puffin, toucan or similar non-junction pedestrian light crossing'),
(5, 'Pedestrian phase at traffic signal junction'),
(7, 'Footbridge or subway'),
(8, 'Central refuge'),
(-1, 'Data missing or out of range');

-- Inserts para a tabela ped_movement
INSERT INTO ped_movement (code, description) VALUES
(0, 'Not a Pedestrian'),
(1, 'Crossing from driver''s nearside'),
(2, 'Crossing from nearside - masked by parked or stationary vehicle'),
(3, 'Crossing from driver''s offside'),
(4, 'Crossing from offside - masked by parked or stationary vehicle'),
(5, 'In carriageway, stationary - not crossing (standing or playing)'),
(6, 'In carriageway, stationary - not crossing (standing or playing) - masked by parked or stationary vehicle'),
(7, 'Walking along in carriageway, facing traffic'),
(8, 'Walking along in carriageway, back to traffic'),
(9, 'Unknown or other'),
(-1, 'Data missing or out of range');

-- Inserts para a tabela propulsion_code
INSERT INTO propulsion_code (code, description) VALUES
(1, 'Petrol'),
(2, 'Heavy oil'),
(3, 'Electric'),
(4, 'Steam'),
(5, 'Gas'),
(6, 'Petrol/Gas (LPG)'),
(7, 'Gas/Bi-fuel'),
(8, 'Hybrid electric'),
(9, 'Gas Diesel'),
(10, 'New fuel technology'),
(11, 'Fuel cells'),
(12, 'Electric diesel'),
(-1, 'Undefined');

-- Inserts para a tabela road_surface
INSERT INTO road_surface (code, description) VALUES
(1, 'Dry'),
(2, 'Wet or damp'),
(3, 'Snow'),
(4, 'Frost or ice'),
(5, 'Flood over 3cm. deep'),
(6, 'Oil or diesel'),
(7, 'Mud'),
(-1, 'Data missing or out of range'),
(9, 'unknown (self reported)');

-- Inserts para a tabela road_type
INSERT INTO road_type (code, description) VALUES
(1, 'Roundabout'),
(2, 'One way street'),
(3, 'Dual carriageway'),
(6, 'Single carriageway'),
(7, 'Slip road'),
(9, 'Unknown'),
(12, 'One way street/Slip road'),
(-1, 'Data missing or out of range');

-- Inserts para a tabela sex
INSERT INTO sex (code, description) VALUES
(1, 'Male'),
(2, 'Female'),
(3, 'Not known'),
(-1, 'Data missing or out of range');

-- Inserts para a tabela special_conditions_at_site
INSERT INTO special_conditions_at_site (code, description) VALUES
(0, 'None'),
(1, 'Auto traffic signal - out'),
(2, 'Auto signal part defective'),
(3, 'Road sign or marking defective or obscured'),
(4, 'Roadworks'),
(5, 'Road surface defective'),
(6, 'Oil or diesel'),
(7, 'Mud'),
(-1, 'Data missing or out of range'),
(9, 'unknown (self reported)');

-- Inserts para a tabela urban_rural
INSERT INTO urban_rural (code, description) VALUES
(1, 'Urban'),
(2, 'Rural'),
(3, 'Unallocated');

-- Inserts para a tabela vehicle_location
INSERT INTO vehicle_location (code, description) VALUES
(0, 'On main c''way - not in restricted lane'),
(1, 'Tram/Light rail track'),
(2, 'Bus lane'),
(3, 'Busway (including guided busway)'),
(4, 'Cycle lane (on main carriageway)'),
(5, 'Cycleway or shared use footway (not part of main carriageway)'),
(6, 'On lay-by or hard shoulder'),
(7, 'Entering lay-by or hard shoulder'),
(8, 'Leaving lay-by or hard shoulder'),
(9, 'Footway (pavement)'),
(10, 'Not on carriageway'),
(-1, 'Data missing or out of range');

-- Inserts para a tabela vehicle_manoeuvre
INSERT INTO vehicle_manoeuvre (code, description) VALUES
(1, 'Reversing'),
(2, 'Parked'),
(3, 'Waiting to go - held up'),
(4, 'Slowing or stopping'),
(5, 'Moving off'),
(6, 'U-turn'),
(7, 'Turning left'),
(8, 'Waiting to turn left'),
(9, 'Turning right'),
(10, 'Waiting to turn right'),
(11, 'Changing lane to left'),
(12, 'Changing lane to right'),
(13, 'Overtaking moving vehicle - offside'),
(14, 'Overtaking static vehicle - offside'),
(15, 'Overtaking - nearside'),
(16, 'Going ahead left-hand bend'),
(17, 'Going ahead right-hand bend'),
(18, 'Going ahead other'),
(-1, 'Data missing or out of range');

-- Inserts para a tabela vehicle_type
INSERT INTO vehicle_type (code, description) VALUES
(1, 'Pedal cycle'),
(2, 'Motorcycle 50cc and under'),
(3, 'Motorcycle 125cc and under'),
(4, 'Motorcycle over 125cc and up to 500cc'),
(5, 'Motorcycle over 500cc'),
(8, 'Taxi/Private hire car'),
(9, 'Car'),
(10, 'Minibus (8 - 16 passenger seats)'),
(11, 'Bus or coach (17 or more pass seats)'),
(16, 'Ridden horse'),
(17, 'Agricultural vehicle'),
(18, 'Tram'),
(19, 'Van / Goods 3.5 tonnes mgw or under'),
(20, 'Goods over 3.5t. and under 7.5t'),
(21, 'Goods 7.5 tonnes mgw and over'),
(22, 'Mobility scooter'),
(23, 'Electric motorcycle'),
(90, 'Other vehicle'),
(97, 'Motorcycle - unknown cc'),
(98, 'Goods vehicle - unknown weight'),
(-1, 'Data missing or out of range');

-- Inserts para a tabela weather
INSERT INTO weather (code, description) VALUES
(1, 'Fine no high winds'),
(2, 'Raining no high winds'),
(3, 'Snowing no high winds'),
(4, 'Fine + high winds'),
(5, 'Raining + high winds'),
(6, 'Snowing + high winds'),
(7, 'Fog or mist'),
(8, 'Other'),
(9, 'Unknown'),
(-1, 'Data missing or out of range');