CREATE TABLE administrador(
  correoe varchar(100) PRIMARY KEY,
  nombre varchar(100)
);

CREATE TABLE estudiante(
    correoe varchar(100) PRIMARY KEY,
    nombre varchar(100) ,
    appat varchar(100) ,
    apmat varchar(100) ,
    nocuenta varchar(100) ,
    universidad varchar(100) ,
    histacd blob,
    idcuenta int
  ) ;

CREATE TABLE usuario(
  correoe varchar(100) PRIMARY KEY,
  contrasena varchar(100)
);

alter table usuario add constraint pkestudiante foreign key (correoe) references estudiante(correoe);

alter table usuario add constraint pkadministrador foreign key (correoe) references administrador(correoe);

CREATE TABLE cuenta(
  idcuenta intPRIMARY KEY,
  creditos float,
  fechavenc date
);

alter table estudiante add constraint pkcuenta foreign key (idcuenta) references cuenta(idcuenta);
