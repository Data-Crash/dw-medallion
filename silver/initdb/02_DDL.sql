CREATE TABLE joined (
	accident_index text NULL,
	vehicle_reference int4 NULL,
	longitude float8 NULL,
	latitude float8 NULL,
	accident_severity int4 NULL,
	number_of_vehicles int4 NULL,
	number_of_casualties int4 NULL,
	accident_timestamp date NULL,
	day_of_week int4 NULL,
	accident_time text NULL,
	road_type int4 NULL,
	speed_limit int4 NULL,
	junction_detail int4 NULL,
	junction_control int4 NULL,
	pedestrian_crossing_physical_facilities int4 NULL,
	light_conditions int4 NULL,
	weather_conditions int4 NULL,
	road_surface_conditions int4 NULL,
	special_conditions_at_site int4 NULL,
	carriageway_hazards int4 NULL,
	urban_or_rural_area int4 NULL,
	vehicle_type int4 NULL,
	vehicle_manoeuvre int4 NULL,
	vehicle_location_restricted_lane int4 NULL,
	was_vehicle_left_hand_drive int4 NULL,
	sex_of_driver int4 NULL,
	age_of_driver int4 NULL,
	age_band_of_driver int4 NULL,
	propulsion_code int4 NULL,
	age_of_vehicle int4 NULL,
	casualty_reference int4 NULL,
	casualty_class int4 NULL,
	sex_of_casualty int4 NULL,
	age_of_casualty int4 NULL,
	age_band_of_casualty int4 NULL,
	casualty_severity int4 NULL,
	pedestrian_movement int4 NULL,
	car_passenger int4 NULL,
	bus_or_coach_passenger int4 NULL,
	casualty_type int4 NULL
);



Create table accident_severity (
    code int primary key,
    description varchar(25)
);

Create table age_band (
    code int primary key,
    description varchar(25)
);

Create table bus_or_coach (
    code int primary key,
    description varchar(50)
);

Create table car_passenger (
    code int primary key,
    description varchar(150)
);

Create table carriageway_hazard (
    code int primary key,
    description varchar(150)
);

Create table casualty_class (
    code int primary key,
    description varchar(50)
);

Create table casualty_severity (
    code int primary key,
    description varchar(25)
);

Create table casualty_type (
    code int primary key,
    description varchar(150)
);

Create table day_of_week (
    code int primary key,
    description varchar(25)
);

Create table junction_control (
    code int primary key,
    description varchar(50)
);

Create table junction_detail (
    code int primary key,
    description varchar(50)
);

Create table light_conditions (
    code int primary key,
    description varchar(50)
);

Create table ped_cross_physical (
    code int primary key,
    description varchar(150)
);

Create table ped_movement (
    code int primary key,
    description varchar(150)
);

Create table propulsion_code(
    code int primary key,
    description varchar(50)
);

Create table road_surface (
    code int primary key,
    description varchar(50)
);

Create table road_type (
    code int primary key,
    description varchar(50)
);

Create table sex(
    code int primary key,
    description varchar(50)
);

Create table special_conditions_at_site(
    code int primary key,
    description varchar(150)
);

Create table urban_rural(
    code int primary key,
    description varchar(25)
);

Create table vehicle_location(
    code int primary key,
    description varchar(150)
);

Create table vehicle_manoeuvre(
    code int primary key,
    description varchar(50)
);

Create table vehicle_type(
    code int primary key,
    description varchar(50)
);

Create table weather(
    code int primary key,
    description varchar(50)
);

CREATE TABLE accident (
    accident_index CHAR(13) PRIMARY KEY,
    longitude DOUBLE PRECISION,
    latitude DOUBLE PRECISION,
    accident_severity INT REFERENCES accident_severity(code),
    number_of_vehicles INT,
    number_of_casualties INT,
    accident_timestamp TIMESTAMP,
    day_of_week INT REFERENCES day_of_week(code),
    accident_time CHAR(5),
    road_type INT REFERENCES road_type(code),
    speed_limit INT,
    junction_detail INT REFERENCES junction_detail(code),
    junction_control INT REFERENCES junction_control(code),
    pedestrian_crossing_physical_facilities INT REFERENCES ped_cross_physical(code),
    light_conditions INT REFERENCES light_conditions(code),
    weather_conditions INT REFERENCES weather(code),
    road_surface_conditions INT REFERENCES road_surface(code),
    special_conditions_at_site INT REFERENCES special_conditions_at_site(code),
    carriageway_hazards INT REFERENCES carriageway_hazard(code),
    urban_or_rural_area INT REFERENCES urban_rural(code)
);

CREATE TABLE vehicle (
    accident_index CHAR(13),
    vehicle_reference INT,
    vehicle_type INT REFERENCES vehicle_type(code),
    vehicle_manoeuvre INT REFERENCES vehicle_manoeuvre(code),
    vehicle_location_restricted_lane INT REFERENCES vehicle_location(code),
    was_vehicle_left_hand_drive INT,
    sex_of_driver INT REFERENCES sex(code),
    age_of_driver INT,
    age_band_of_driver INT REFERENCES age_band(code),
    propulsion_code INT REFERENCES propulsion_code(code),
    age_of_vehicle INT,
    PRIMARY KEY (accident_index, vehicle_reference),
    FOREIGN KEY (accident_index) REFERENCES accident(accident_index)
);

CREATE TABLE casualty (
    accident_index CHAR(13),
    vehicle_reference INT,
    casualty_reference INT,
    casualty_class INT REFERENCES casualty_class(code),
    sex_of_casualty INT REFERENCES sex(code),
    age_of_casualty INT,
    age_band_of_casualty INT REFERENCES age_band(code),
    casualty_severity INT REFERENCES casualty_severity(code),
    pedestrian_movement INT REFERENCES ped_movement(code),
    car_passenger INT REFERENCES car_passenger(code),
    bus_or_coach_passenger INT REFERENCES bus_or_coach(code),
    casualty_type INT REFERENCES casualty_type(code),
    PRIMARY KEY (accident_index, vehicle_reference, casualty_reference),
    FOREIGN KEY (accident_index) REFERENCES accident(accident_index),
    FOREIGN KEY (accident_index, vehicle_reference) REFERENCES vehicle(accident_index, vehicle_reference)
);

