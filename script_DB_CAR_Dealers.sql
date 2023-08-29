-- Tabla Proveedor
CREATE TABLE providers (
    provider_code SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(100),
    city VARCHAR(100),
    province VARCHAR(150)
);

--
CREATE TABLE Category (
    category_code SERIAL PRIMARY KEY,
    name_category VARCHAR(255) NOT NULL
);
-- Tabla Pieza
CREATE TABLE Part (
    part_code SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    color VARCHAR(100),
    price DECIMAL(10, 2) NOT NULL,
    category_code INT REFERENCES Category (category_code)
);

-- Tabla Categoría


-- Tabla Suministro
CREATE TABLE Supply (
    supply_id SERIAL PRIMARY KEY,
    provider_code INT REFERENCES providers(provider_code),
    part_code INT REFERENCES Part(part_code),
    supply_date DATE,
    amount INT
);

-- Tabla Automóvil
CREATE TABLE Car (
    frame_number CHAR(20) PRIMARY KEY,
    brand VARCHAR(150) NOT NULL,
    model VARCHAR(150) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    discount DECIMAL(5, 2),
    fiscal_strenght INT,
    displacement INT
    -- Agregar otros datos técnicos aquí
);

-- Tabla Equipamiento
CREATE TABLE equipment (
    id_equipment SERIAL PRIMARY KEY,
   equipment_name VARCHAR(150) NOT NULL
);

-- Tabla Extra
CREATE TABLE Extra (
    extra_id SERIAL PRIMARY KEY,
    extra_name VARCHAR(150) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Tabla Modelo_Equipamiento
CREATE TABLE Model_Equipment (
    relation_id SERIAL PRIMARY KEY,
    frame_number CHAR(17) REFERENCES Car (frame_number),
    id_equipment INT REFERENCES equipment(id_equipment)
);

-- Tabla Modelo_Extra
CREATE TABLE Model_Extra (
    relation_id SERIAL PRIMARY KEY,
    frame_number CHAR(17) REFERENCES Car(frame_number),
    extra_id INT REFERENCES Extra(extra_id)
);

-- Tabla Stock
CREATE TABLE Stock (
    id_stock SERIAL PRIMARY KEY,
    frame_number CHAR(17) REFERENCES Car(frame_number),
    location VARCHAR(150)
);

-- Tabla Servicio_Oficial
CREATE TABLE Official_service (
    ine CHAR(9) PRIMARY KEY,
    service_name VARCHAR(150) NOT NULL,
    home VARCHAR(255)
);

-- Tabla Vendedor
CREATE TABLE seller (
    ine CHAR(9) PRIMARY KEY,
    seller_name VARCHAR(150) NOT NULL,
    home VARCHAR(150)
    -- Agregar otros datos personales aquí
);

-- Tabla Venta
CREATE TABLE Sale (
    sale_id SERIAL PRIMARY KEY,
    frame_number CHAR(17) REFERENCES Car(frame_number),
    ine_seller CHAR(9) REFERENCES Seller(ine),
    ine_service CHAR(9) REFERENCES Official_service(ine),
    sale_price DECIMAL(10, 2) NOT NULL,
    payment_mode VARCHAR(150),
    deliver_date DATE,
    tuition VARCHAR(10),
    stock_or_order VARCHAR(124)
);
