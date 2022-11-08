CREATE TABLE patients (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL
)

CREATE TABLE medical_histories (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    admitted_at DATE NOT NULL,
    status VARCHAR(100) NOT NULL,
    patient_id INT NULL REFERENCES patients(id) ON DELETE CASCADE
)

CREATE TABLE treatments (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    type VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL
)

CREATE TABLE invoices (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id INT REFERENCES medical_histories(id) ON DELETE CASCADE
)

CREATE TABLE invoice_items (
    id BIGSERIAL NOT NULL PRIMARY kEY,
    unit_price decimal,
    quantity INT,
    total_price decimal,
    invoice_id INT REFERENCES invoices(id) ON DELETE CASCADE,
    treatment_id INT REFERENCES treatments(id) ON DELETE CASCADE
)

CREATE TABLE patient_file (
    history_id INT REFERENCES medical_histories(id),
    treatment_id INT REFERENCES treatments(id)
)
