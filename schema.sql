-- =========================================================
-- Star Schema - Foco em Professor
-- Baseado no modelo relacional fornecido no desafio DIO
-- =========================================================

CREATE TABLE dim_professor (
    sk_professor            INT PRIMARY KEY,
    id_professor            INT NOT NULL,           
    nome                    VARCHAR(45),             
    indicador_coordenador   CHAR(1)                 
);

CREATE TABLE dim_departamento (
    sk_departamento         INT PRIMARY KEY,
    id_departamento         INT NOT NULL,
    nome                    VARCHAR(45),
    campus                  VARCHAR(45)
);

CREATE TABLE dim_curso (
    sk_curso                INT PRIMARY KEY,
    id_curso                INT NOT NULL,
    nome                    VARCHAR(45),             
    id_departamento         INT                      
);

CREATE TABLE dim_disciplina (
    sk_disciplina           INT PRIMARY KEY,
    id_disciplina           INT NOT NULL,
    nome                    VARCHAR(45),             
    carga_horaria           INT                      
);

CREATE TABLE dim_data (
    sk_data                 INT PRIMARY KEY,
    data_completa           DATE NOT NULL,
    ano                     INT,
    semestre                INT,
    mes                     INT,
    nome_mes                VARCHAR(20),
    dia                     INT,
    dia_semana              VARCHAR(15)
    
);

CREATE TABLE fato_professor (
    sk_professor            INT NOT NULL REFERENCES dim_professor(sk_professor),
    sk_departamento         INT NOT NULL REFERENCES dim_departamento(sk_departamento),
    sk_curso                INT NOT NULL REFERENCES dim_curso(sk_curso),
    sk_disciplina           INT NOT NULL REFERENCES dim_disciplina(sk_disciplina),
    sk_data                 INT NOT NULL REFERENCES dim_data(sk_data),
    quantidade_ocorrencias  INT DEFAULT 1            
);
