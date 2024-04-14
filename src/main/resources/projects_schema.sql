CREATE database projects;

USE projects;

DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS category;



CREATE TABLE projects (
	project_id INT AUTO_INCREMENT NOT NULL, 
    project_name VARCHAR(100) NOT NULL,
    estimated_hours TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    actual_hours TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    difficulty TEXT,
    notes TEXT,
    PRIMARY KEY (project_id)
);

CREATE TABLE material (
	material_id INT AUTO_INCREMENT NOT NULL,
    project_id INT NOT NULL,
    material_name VARCHAR(100),
    num_required INT NOT NULL,
    cost DECIMAL(7, 2),
	PRIMARY KEY (material_id),
	FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE
);

CREATE TABLE step (
	step_id INT AUTO_INCREMENT NOT NULL,
    project_id INT NOT NULL,
    step_text TEXT,
    step_order INT,
	PRIMARY KEY (step_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE
);

CREATE TABLE category (
	category_id INT AUTO_INCREMENT NOT NULL,
	category_name VARCHAR(100),
	PRIMARY KEY (category_id)
);

CREATE TABLE project_category (
	project_id INT NOT NULL,
    category_id INT NOT NULL,
	FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE,
    UNIQUE KEY (project_id, category_id)
);