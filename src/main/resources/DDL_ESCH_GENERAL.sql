--create schema sat_aduanas_miad_gen;

create table if not exists sat_aduanas_miad_gen.ad_miad_aduanas
(
	codigo_aduana varchar(2) unique not null,	
	nombre_aduana varchar(256),
    activo boolean default true,
    tipo_aduana integer not null,
    cod_modo_tranporte integer not null,
    cod_pais integer not null,
	id_gft_area integer unique not null,
	cod_localizacion integer not null,
	tipo_despacho varchar(1),
	selectivo_rm varchar(1),
	aduana_sin_papeles varchar(1),
	usuario_agrega  varchar(15) not null,
	usuario_modifica varchar(15) not null,
	fecha_agrega timestamp default current_timestamp,
	fecha_modifica timestamp default current_timestamp,
	constraint pk_codigo_aduana primary key(codigo_aduana,cod_localizacion)
    
);

alter table  sat_aduanas_miad_gen.ad_miad_aduanas
add constraint fk_tipo_aduana foreign key(tipo_aduana) references sat_aduanas_miad_gen.ad_catalogos(id_catalogo);

alter table  sat_aduanas_miad_gen.ad_miad_aduanas
add constraint fk_codigo_transporte foreign key(cod_modo_tranporte) references sat_aduanas_miad_gen.ad_catalogos(id_catalogo);

alter table  sat_aduanas_miad_gen.ad_miad_aduanas
add constraint fk_codigo_pais foreign key(cod_pais) references sat_aduanas_miad_gen.ad_catalogos(id_catalogo);

---------------------------------------------

create table if not exists sat_aduanas_miad_gen.ad_tipo_catalogos
(
	id_tipo_catalogo integer generated always as identity(start with 1 increment by 1),
	nombre varchar(16) not null,
	login_creo varchar(10) not null,
	fecha_creacion timestamp default current_timestamp,
	fecha_modificacion timestamp default current_timestamp,
	login_modifico varchar(10) not null,
	constraint pk_tipo_catalogos primary key(id_tipo_catalogo)
);

create table if not exists sat_aduanas_miad_gen.ad_catalogos
(
	id_catalogo integer generated always 
	as identity(start with 1 increment by 1),
	codigo_catalogo integer,
	nombre_catalogo varchar(255)not null,
	descripcion_catalogo varchar(128)not null,
	fecha_creacion timestamp default current_timestamp,
	estado boolean default true,
	fecha_modificacion timestamp default current_timestamp,
	login_creacion varchar(8),
	login_modificacion varchar(8),
	constraint pk_catalogos 
	primary key(id_catalogo)
);

alter table sat_aduanas_miad_gen.ad_catalogos  add constraint fk_tipo_catalogos
foreign key(codigo_catalogo) references sat_aduanas_miad_gen.ad_tipo_catalogos(id_tipo_catalogo);




GRANT SELECT ON ALL TABLES IN SCHEMA sat_aduanas_miad_gen TO rol_ap_sat_aduanas_gestion_electronica;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA sat_aduanas_miad_gen TO rol_ap_sat_aduanas_gestion_electronica;
GRANT rol_ap_sat_aduanas_gestion_electronica TO ap_sat_aduanas_gestion_electronica;
GRANT USAGE ON SCHEMA sat_aduanas_miad_gen TO rol_ap_sat_aduanas_gestion_electronica;


