ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YY';

Create table Region(
    id_region       NUMBER(1000) NOT NULL,
    nombre          VARCHAR(254) NOT NULL
);

ALTER TABLE Region ADD CONSTRAINT region_PK PRIMARY KEY (id_region);

Create Table Provincia(
    id_provincia    NUMBER(1000) NOT NULL,
    nombre          VARCHAR(254) NOT NULL
);

ALTER TABLE Provincia ADD CONSTRAINT provincia_PK PRIMARY KEY (id_provincia);

Create Table Comuna(
    id_provincia    NUMBER(1000) NOT NULL,
    nombre          VARCHAR(254) NOT NULL
);

ALTER TABLE Comuna ADD CONSTRAINT comuna_PK PRIMARY KEY (id_comuna);

Create Table Sindicato(
    id_sindicato    NUMBER(1000) NOT NULL,
    nombre          VARCHAR(254) NOT NULL,
    direccion       VARCHAR(254) NOT NULL
);

ALTER TABLE Sindicato ADD CONSTRAINT sindicato_PK PRIMARY KEY (id_sindicato);

Create Table Aseguradora(
    id_aseguradora  NUMBER(1000) NOT NULL,
    nombre          VARCHAR(254) NOT NULL,
    rut             NUMBER(10) NOT NULL,
    dv              VARCHAR(1) NOT NULL  
);

ALTER TABLE Aseguradora ADD CONSTRAINT aseguradora_PK PRIMARY KEY (id_aseguradora);

Create Table Descuento_por_caracteristicas(
    id_descuento_caracteristica     NUMBER(1000) NOT NULL,
    porcentaje_descuento            NUMBER(1000) NOT NULL
);

ALTER TABLE Descuento_por_caracteristicas ADD CONSTRAINT caracteristicas_descuento_PK PRIMARY KEY (id_descuento_caracteristica);

Create Table Afiliado(
    id_afiliado         NUMBER(1000) NOT NULL,
    rut                 NUMBER(10) NOT NULL,
    dv                  VARCHAR(1) NOT NULL,
    primer_nombre       VARCHAR(254) NOT NULL,
    segundo_nombre      VARCHAR(254) NULL,
    apellido_paterno    VARCHAR(254) NOT NULL,
    apellido_materno    VARCHAR(254) NULL,
    edad                NUMBER(1000) NOT NULL,
    tiene_discapacidad  BOOLEAN(1) NOT NULL,
    correo              NVARCHAR(254) NOT NULL,
    curriculum          FILE NOT NULL,
    direccion           VARCHAR (254) NOT NULL
);

ALTER TABLE Afiliado ADD CONSTRAINT afiliado_PK PRIMARY KEY (id_afiliado);

Create Table Extranjero(
    numero_pasaporte    NUMBER (1000) NOT NULL,
    nacionalidad        VARCHAR(1000) NOT NULL,
    pretencion_sueldo   NUMBER (1000) NOT NULL
);

ALTER TABLE Extranjero ADD CONSTRAINT extranjero_pk PRIMARY KEY (id_afiliado) References Afiliado (id_afiliado); 

Create Table Tipo_discapacidad(
    id_tipo_discapacidad    NUMBER(1000) NOT NULL,
    nombre_discapacidad     VARCHAR(254) NOT NULL
);

ALTER TABLE Tipo_discapacidad ADD CONSTRAINT discapacidad_PK PRIMARY KEY (id_tipo_discapacidad);

Create Table Telefono(
    id_telefono     NUMBER(1000) NOT NULL,
    numero          NUMBER(1000) NOT NULL
);

ALTER TABLE Telefono ADD CONSTRAINT telefono_PK PRIMARY KEY (id_telefono);

Create Table Tipo_de_telefono(
    id_tipo_telefono        NUMBER(!000) NOT NULL,
    tipo_telefono           VARCHAR(254) NOT NULL
);

ALTER TABLE Tipo_de_telefono ADD CONSTRAINT tipo_telefono_PK PRIMARY KEY (id_tipo_telefono);

Create Table Cargas_futuro_afiliado(
    id_carga_futuro_afiliado    NUMBER(1000) NOT NULL,
    rut                        NUMBER(10) NOT NULL,
    dv                          VARCHAR(1) NOT NULL,
    primer_nombre               VARCHAR(254) NOT NULL,
    segundo_nombre              VARCHAR(254) NULL,
    apellido_paterno            VARCHAR(254) NOT NULL,
    apellido_materno            VARCHAR(254) NULL,
    fecha_nacimiento            DATE NOT NULL
);

ALTER TABLE Cargas_futuro_afiliado ADD CONSTRAINT futuro_afiliado_PK PRIMARY KEY (id_carga_futuro_afiliado);

Create Table Tipo_de_parentezco(
    id_tipo_de_parentezco   NUMBER(1000) NOT NULL,
    Parentezco              BOOLEAN (1) NOT NULL
);

ALTER TABLE Tipo_de_parentezco ADD CONSTRAINT tipo_de_parentezco_PK PRIMARY KEY (id_tipo_de_parentezco);

Create Table Pareja(
    relacion        VARCHAR(254) NOT NULL
);

ALTER TABLE Pareja ADD CONSTRAINT pareja_PK PRIMARY KEY (id_tipo_de_parentezco) References Tipo_de_parentezco (id_tipo_de_parentezco)

Create Table Afiliado_beneficios(
    id_afiliado_beneficios     NUMBER (1000) NOT NULL,
    buscador        VARCHAR(254) NOT NULL
);

ALTER TABLE Afiliado_beneficios ADD CONSTRAINT afiliado_beneficios_PK PRIMARY KEY (id_afiliado_beneficios);

Create Table Beneficios(
    id_beneficios       NUMBER(1000) NOT NULL,
    tiene_beneficio     BOOLEAN(1) NOT NULL
);

ALTER TABLE Beneficios ADD CONSTRAINT beneficios_PK PRIMARY KEY (id_beneficios);

Create Table Tipo_Beneficios(
    id_tipo_beneficios  NUMBER(1000) NOT NULL,
    nombre_beneficio    VARCHAR(254) NOT NULL,
    cantidad_de_usos    NUMBER(1000) NOT NULL
);

ALTER TABLE Tipo_Beneficios ADD CONSTRAINT tipo_beneficio_PK PRIMARY KEY (id_tipo_beneficios);

Create Table Tipo_transporte(
    id_tipo_transporte  NUMBER(1000) NOT NULL,
    tipo_transporte     VARCHAR(254) NOT NULL
);

ALTER TABLE Tipo_transporte ADD CONSTRAINT tipo_transporte_PK PRIMARY KEY (id_tipo_transporte);

Create Table Descuento_por_transporte(
    id_descuento_por_transporte     NUMBER(1000) NOT NULL,
    porcentaje_descuento            NUMBER(1000) NOT NULL
); 

ALTER TABLE Descuento_por_transporte ADD CONSTRAINT descuento_transporte_PK PRIMARY KEY (id_descuento_por_transporte);

Create Table Pagos(
    id_pagos        NUMBER(1000) NOT NULL,
    pago_inicial    NUMBER(1000) NOT NULL,
    pago_mensual    NUMBER(1000) NOT NULL
);

ALTER TABLE Pagos ADD CONSTRAINT pagos_PK PRIMARY KEY (id_pagos);

Create Table Tipo_de_pago(
    id_tipo_de_pago NUMBER(1000) NOT NULL,
    tipo_pago       BOOLEAN(2) NOT NULL
);

ALTER TABLE Tipo_de_pago ADD CONSTRAINT tipo_pago_PK PRIMARY KEY (id_tipo_de_pago);

Create Table Cheque(
    id_cheque       NUMBER(1000) NOT NULL,
    numero_cheque   NUMBER(1000) NOT NULL
);

ALTER TABLE Cheque ADD CONSTRAINT cheque_PK PRIMARY KEY (id_cheque);

Create Table Banco(
    id_banco        NUMBER(1000) NOT NULL,
    nombre          NUMBER(1000) NOT NULL
);

ALTER TABLE Banco ADD CONSTRAINT banco_PK PRIMARY KEY (id_banco);

Create Table Solicitud(
    id_solicitud    NUMBER(1000) NOT NULL,
    fecha_creacion  DATE NOT NULL
);

ALTER TABLE Solicitud ADD CONSTRAINT solicitud_PK PRIMARY KEY (id_solicitud);

Create Table Estado_afiliacion(
    id_estado           NUMBER(1000) NOT NULL,
    estado_de_usuario   BOOLEAN(1) NOT NULL
);

ALTER TABLE Estado_afiliacion ADD CONSTRAINT estado_afiliacion_PK PRIMARY KEY (id_estado);

ALTER TABLE  Provincia ADD CONSTRAINT provincia_id_region_FK FOREIGN KEY (id_region) References Region (id_region);

ALTER TABLE Comuna ADD CONSTRAINT comuna_id_provincia_FK FOREIGN KEY (id_provincia) References Provincia (id_provincia); 

ALTER TABLE Aseguradora ADD CONSTRAINT aseguradora_id_comuna_FK FOREIGN KEY (id_comuna) References Comuna (id_comuna);

ALTER TABLE Descuento_por_caracteristicas ADD CONSTRAINT descuento_por_caracteristicas_id_aseguradora_FK FOREIGN KEY (id_aseguradora) References Aseguradora (id_aseguradora);

ALTER TABLE Sindicato ADD CONSTRAINT sindicato_id_comuna_FK FOREIGN KEY (id_comuna) References Comuna (id_comuna);
ALTER TABLE Sindicato ADD CONSTRAINT sindicato_id_aseguradora_FK FOREIGN KEY (id_aseguradora) References Aseguradora (id_aseguradora);

ALTER TABLE Afiliado ADD CONSTRAINT afiliado_id_estado_afiliacion_FK FOREIGN KEY (id_estado_afiliacion) References Estado_afiliacion (id_estado_afiliacion);
ALTER TABLE Afiliado ADD CONSTRAINT afiliado_id_afiliado_beneficios_FK FOREIGN KEY (id_afiliado_beneficios) References Afiliado_beneficios (id_afiliado_beneficios);
ALTER TABLE Afiliado ADD CONSTRAINT afiliado_id_comuna_FK FOREIGN KEY (id_comuna) References Comuna (id_comuna);
ALTER TABLE Afiliado ADD CONSTRAINT afiliado_id_solicitud_FK FOREIGN KEY (id_solicitud) References Solicitud (id_solicitud);

ALTER TABLE Extranjero ADD CONSTRAINT extranjero_id_afiliado_FK FOREIGN KEY (id_afiliado) References Afiliado (id_afiliado);

ALTER TABLE Telefono ADD CONSTRAINT telefono_id_afiliado_FK FOREIGN KEY (id_afiliado) References Afiliado (id_afiliado);

ALTER TABLE Tipo_de_telefono ADD CONSTRAINT tipo_telefono_id_telefono_FK FOREIGN KEY (id_telefono) References Telefono (id_telefono);

ALTER TABLE Cargas_futuro_afiliado ADD CONSTRAINT Cargas_futuro_afiliado_id_afiliado_FK FOREIGN KEY (id_afiliado) References Afiliado (id_afiliado);

ALTER TABLE Tipo_de_parentezco ADD CONSTRAINT tipo_de_parentezco_id_cargas_futuro_afiliado_FK FOREIGN KEY (id_carga_futuro_afiliado) References Cargas_futuro_afiliado (id_carga_futuro_afiliado);

ALTER TABLE Pareja ADD CONSTRAINT pareja_id_tipo_de_parentezco_FK FOREIGN KEY (id_tipo_de_parentezco) References Tipo_de_parentezco (id_tipo_de_parentezco);

ALTER TABLE Pagos ADD CONSTRAINT pagos_id_afiliado_FK FOREIGN KEY (id_afiliado) References Afiliado (id_afiliado);

ALTER TABLE Cheque ADD CONSTRAINT cheque_id_banco_FK FOREIGN KEY (id_banco) References Banco (id_banco);
ALTER TABLE Cheque ADD CONSTRAINT cheque_id_tipo_de_pago_FK FOREIGN KEY (id_tipo_de_pago) References Tipo_de_pago (id_tipo_de_pago);

ALTER TABLE Tipo_de_pago ADD CONSTRAINT tipo_de_pago_id_pagos_FK FOREIGN KEY (id_pagos) References Pagos (id_pagos);
ALTER TABLE Tipo_de_pago ADD CONSTRAINT tipo_de_pago_id_cheque_FK FOREIGN KEY (id_cheques) References Cheques (id_cheques);

ALTER TABLE Beneficios ADD CONSTRAINT beneficios_id_afiliado_beneficios_FK FOREIGN KEY (id_afiliado_beneficios) References Afiliado_beneficios (id_afiliado_beneficios);

ALTER TABLE Tipo_Beneficios ADD CONSTRAINT tipo_beneficios_id_beneficios_FK FOREIGN KEY (id_beneficios) References Beneficios (id_beneficios);
ALTER TABLE Tipo_Beneficios ADD CONSTRAINT tipo_beneficios_id_tipo_transporte_FK FOREIGN KEY (id_tipo_transporte) References Tipo_transporte (id_tipo_transporte);

ALTER TABLE Tipo_transporte ADD CONSTRAINT tipo_transporte_id_tipo_beneficios_FK FOREIGN KEY (id_tipo_beneficios) References Tipo_Beneficios (id_tipo_beneficios);
ALTER TABLE Tipo_transporte ADD CONSTRAINT tipo_transporte_id_descuento_por_transporte_FK FOREIGN KEY (id_descuento_por_transporte) References Descuento_por_transporte (id_descuento_por_transporte);
 