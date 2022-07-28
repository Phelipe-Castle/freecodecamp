CREATE DATABASE universe;

\c universe;

CREATE TABLE
  galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    age_in_millions_of_years NUMERIC,
    total_moons INT,
    description TEXT
  );

INSERT INTO
  galaxy (
    name,
    age_in_millions_of_years,
    total_moons,
    description
  )
VALUES
  (
    'Andromeda Galaxy',
    10.000,
    1.000,
    'Andromeda Galaxy, also called Andromeda Nebula, (catalog numbers NGC 224 and M31), great spiral galaxy in the constellation Andromeda, the nearest large galaxy. The Andromeda Galaxy is one of the few visible to the unaided eye, appearing as a milky blur. It is located about 2,480,000 light-years from Earth;'
  ),
  (
    'Canis Major Dwarf Galaxy',
    10.000,
    1.000,
    'Description'
  ),
  ('Cygnus A', 10.000, 1.000, 'Description'),
  (
    'Andromeda Galaxy 2',
    10.000,
    1.000,
    'Andromeda Galaxy, also called Andromeda Nebula, (catalog numbers NGC 224 and M31), great spiral galaxy in the constellation Andromeda, the nearest large galaxy. The Andromeda Galaxy is one of the few visible to the unaided eye, appearing as a milky blur. It is located about 2,480,000 light-years from Earth;'
  ),
  (
    'Canis Major Dwarf Galaxy 2',
    10.000,
    1.000,
    'Description'
  ),
  ('Cygnus A 2', 10.000, 1.000, 'Description');

CREATE TABLE
  star (
    star_id SERIAL PRIMARY KEY,
    galaxy_id INT NOT NULL,
    name VARCHAR(255) NOT NULL UNIQUE,
    age_in_millions_of_years NUMERIC,
    total_moons INT,
    has_life BOOLEAN,
    description TEXT,
    FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id)
  );

INSERT INTO
  star (
    galaxy_id,
    name,
    age_in_millions_of_years,
    total_moons,
    description,
    has_life
  )
VALUES
  (1, 'Star 1', 10000, 2, 'Description', False),
  (2, 'Star 2', 10000, 2, 'Description', False),
  (3, 'Star 3', 10000, 2, 'Description', True),
  (1, 'Star 4', 10000, 2, 'Description', False),
  (2, 'Star 5', 10000, 2, 'Description', False),
  (3, 'Star 6', 10000, 2, 'Description', True);

CREATE TABLE
  planet (
    planet_id SERIAL PRIMARY KEY,
    star_id INT NOT NULL,
    name VARCHAR(255) NOT NULL UNIQUE,
    age_in_millions_of_years NUMERIC,
    description TEXT,
    total_moons INT,
    has_life BOOLEAN,
    FOREIGN KEY(star_id) REFERENCES star(star_id)
  );

INSERT INTO
  planet (
    star_id,
    name,
    age_in_millions_of_years,
    description,
    total_moons,
    has_life
  )
VALUES
  (1, 'Planet 1', 20000, 'Description', 3, True),
  (2, 'Planet 2', 70000, 'Description', 33, True),
  (3, 'Planet 3', 40000, 'Description', 2, False),
  (1, 'Planet 4', 20000, 'Description', 3, True),
  (2, 'Planet 5', 70000, 'Description', 33, True),
  (3, 'Planet 6', 40000, 'Description', 2, False),
  (1, 'Planet 7', 20000, 'Description', 3, True),
  (2, 'Planet 8', 70000, 'Description', 33, True),
  (3, 'Planet 9', 40000, 'Description', 2, False),
  (1, 'Planet 10', 20000, 'Description', 3, True),
  (2, 'Planet 11', 70000, 'Description', 33, True),
  (3, 'Planet 12', 40000, 'Description', 2, False);

CREATE TABLE
  moon (
    moon_id SERIAL PRIMARY KEY,
    planet_id INT NOT NULL,
    distance_from_earth NUMERIC,
    name VARCHAR(255) NOT NULL UNIQUE,
    age_in_millions_of_years NUMERIC,
    description TEXT,
    FOREIGN KEY(planet_id) REFERENCES planet(planet_id)
  );

INSERT INTO
  moon (
    planet_id,
    distance_from_earth,
    name,
    age_in_millions_of_years,
    description
  )
VALUES
  (1, 200000, 'Moon 1', 23212, 'Description'),
  (2, 2340000, 'Moon 2', 232212, 'Description'),
  (3, 2123000, 'Moon 3', 23312, 'Description'),
  (1, 200000, 'Moon 4', 23212, 'Description'),
  (2, 2340000, 'Moon 5', 232212, 'Description'),
  (3, 2123000, 'Moon 6', 23312, 'Description'),
  (1, 200000, 'Moon 7', 23212, 'Description'),
  (2, 2340000, 'Moon 8', 232212, 'Description'),
  (3, 2123000, 'Moon 9', 23312, 'Description'),
  (3, 2123000, 'Moon 10', 23312, 'Description'),
  (1, 200000, 'Moon 11', 23212, 'Description'),
  (2, 2340000, 'Moon 12', 232212, 'Description'),
  (3, 2123000, 'Moon 13', 23312, 'Description'),
  (1, 200000, 'Moon 14', 23212, 'Description'),
  (2, 2340000, 'Moon 15', 232212, 'Description'),
  (3, 2123000, 'Moon 16', 23312, 'Description'),
  (1, 200000, 'Moon 17', 23212, 'Description'),
  (2, 2340000, 'Moon 18', 232212, 'Description'),
  (3, 2123000, 'Moon 19', 23312, 'Description'),
  (3, 2123000, 'Moon 20', 23312, 'Description');

CREATE TABLE
  black_hole(
    black_hole_id SERIAL PRIMARY KEY,
    galaxy_id INT,
    name VARCHAR(255) NOT NULL UNIQUE,
    age_in_millions_of_years NUMERIC,
    description TEXT,
    FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id)
  );

INSERT INTO
  black_hole (
    galaxy_id,
    name,
    age_in_millions_of_years,
    description
  )
VALUES
  (1, 'Black Hole 1', 1231231, 'Description'),
  (2, 'Black Hole 2', 1231231, 'Description'),
  (3, 'Black Hole 3', 1231231, 'Description');