CREATE TABLE Cuenta
  (
    id_cuenta            INTEGER NOT NULL ,
    creditos             INTEGER NOT NULL ,
    fechavenc            DATE NOT NULL ,
    Estudiante_id_cuenta INTEGER NOT NULL
  ) ;
CREATE UNIQUE INDEX Cuenta__IDX ON Cuenta
  (
    Estudiante_id_cuenta ASC
  )
  ;
  ALTER TABLE Cuenta ADD CONSTRAINT Cuenta_PK PRIMARY KEY ( id_cuenta ) ;

CREATE TABLE Estudiante
  (
    nombre      VARCHAR2 (255) NOT NULL ,
    appat       VARCHAR2 (255) NOT NULL ,
    apmat       VARCHAR2 (255) ,
    no_cuenta   VARCHAR2 (255) NOT NULL ,
    universidad VARCHAR2 (255) NOT NULL ,
    histacd BLOB NOT NULL ,
    id_cuenta INTEGER NOT NULL ,
    correo    VARCHAR2 NOT NULL
  ) ;
ALTER TABLE Estudiante ADD CONSTRAINT Estudiante_PK PRIMARY KEY ( id_cuenta ) ;

CREATE TABLE Usuario
  (
    correo               VARCHAR2 (255) NOT NULL ,
    contrasena           VARCHAR2 (255) NOT NULL ,
    Estudiante_id_cuenta INTEGER NOT NULL
  ) ;
CREATE UNIQUE INDEX Usuario__IDX ON Usuario
  (
    Estudiante_id_cuenta ASC
  )
  ;
  ALTER TABLE Usuario ADD CONSTRAINT Usuario_PK PRIMARY KEY ( correo ) ;

ALTER TABLE Cuenta ADD CONSTRAINT Cuenta_Estudiante_FK FOREIGN KEY ( Estudiante_id_cuenta ) REFERENCES Estudiante ( id_cuenta ) ;

ALTER TABLE Usuario ADD CONSTRAINT Usuario_Estudiante_FK FOREIGN KEY ( Estudiante_id_cuenta ) REFERENCES Estudiante ( id_cuenta ) ;