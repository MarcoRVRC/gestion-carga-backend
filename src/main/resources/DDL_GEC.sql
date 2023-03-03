
---------------------SCRIPT DDL-----------------------------------------------------------------------------------

create table if not exists sat_aduanas_gestion_electronica.ad_gestion_electronica_catalogos
(
	id_catalogo integer generated always 
	as identity(start with 1 increment by 1),
	codigo_catalogo varchar(8),
	nombre_catalogo varchar(64)not null,
	descripcion_catalogo varchar(64)not null,
	fecha_creacion timestamp default current_timestamp,
	fecha_modificacion timestamp default current_timestamp,
	login_creacion varchar(8),
	login_modificacion varchar(8),
	constraint pk_catalogos 
	primary key(id_catalogo)
);

create table if not exists sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_general --ad_gec_solicitudes_general
(
	id_solicitud_g integer generated always as identity(start with 1 increment by 1),
	correlativo numeric(9), 
	process_id varchar(16),
	id_estado int not null default 1, --estado 1 == PA o el primer estado
	nit_usuario_creacion varchar(15)not null, 
	fecha_creacion timestamp default current_timestamp,
	nit_usuario_revision varchar(15), 
	fecha_revision timestamp ,
	codigo_aduana varchar(2)not null,
	es_perecedero boolean not null, 
	id_documento varchar(128),
	constraint pk_solicitudes_general
	primary key(id_solicitud_g)
);

alter table sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_general
add constraint fk_id_estado_sol_general foreign key(id_estado) 
references sat_aduanas_gestion_electronica.ad_gestion_electronica_catalogos(id_catalogo);

create table if not exists sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_manifiesto_generado
(
	id_solicitud_mg integer generated always as identity(start with 1 increment by 1),
	id_solicitud_g integer,
	id_tipo_mercancias int not null,
	id_motivo_peticion int not null,
	no_manifiesto varchar(60),
	no_documento_transporte varchar(60),
	no_contenedor varchar(11),
	no_orden_declaracion varchar(16),
	no_vin varchar(60),
	constraint pk_solicitudes_manifiesto_generado
	primary key(id_solicitud_mg)
);

alter table sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_manifiesto_generado
add constraint fk_correlativo_solicitud_mg foreign key(id_solicitud_g)
references sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_general(id_solicitud_g);

--Tabla que almacena otras razones de peticion de manifiesto generado

create table if not exists sat_aduanas_gestion_electronica.ad_gestion_electronica_detalle_razon_peticion
(
	id_detalle_razon integer generated 
	always as identity(start with 1 increment by 1),
	id_solicitud_g integer,
	razon_peticion varchar(1000)not null,
	constraint pk_detalle_razon_peticion
	primary key(id_detalle_razon)
);

alter table sat_aduanas_gestion_electronica.ad_gestion_electronica_detalle_razon_peticion
add constraint fk_detalle_razon_id_solicitud foreign key(id_solicitud_g)
references sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_general(id_solicitud_g);

#----CCE----------------------------------------------------------------------------

create table if not exists sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_cce
(
	id_solicitud_cce integer generated always as identity(start with 1 increment by 1),
	id_solicitud_g integer, 
	no_Manifiesto varchar(60)  not null,
	justificacion varchar(1000) not null,
	no_docto_transporte varchar(60),
	constraint pk_solicitud_cce primary key(id_solicitud_cce)
); 

alter table sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_cce
add constraint fk_correlativo_solicitud_cce foreign key(id_solicitud_g)
references sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_general(id_solicitud_g);

 create table sat_aduanas_gestion_electronica.ad_gestion_electronica_detalle_solicitud
(
 id_detalle_solicitud integer generated always as identity(start with 1 increment by 1),
 id_solicitud_cce integer,
 nombre_campo varchar(150)  not null,
 valor_anterior varchar(150) not null ,
 valor_actual varchar(150) not null,
 necesita_autorizacion boolean,
 constraint pk_detalle_solicitud_cce
 primary key(id_detalle_solicitud)
);   

alter table sat_aduanas_gestion_electronica.ad_gestion_electronica_detalle_solicitud
add constraint fk_detalle_solicitud_id_solicitud foreign key(id_solicitud_cce)
references sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_cce(id_solicitud_cce);

create table if not exists sat_aduanas_gestion_electronica.ad_gestion_electronica_bitacora_estados
(
	id_bitacora_estado integer generated always as identity(start with 1 increment by 1),
	id_solicitud_g integer,
	id_estado int not null, --de la tabla de catalogo
	nit_usuario_gestion varchar(15) not null,
	fecha_creacion timestamp default current_timestamp,
	fecha_modificacion timestamp default current_timestamp,
	nit_usuario_modifico varchar(150) not null,
	constraint pk_bitacora_estados primary key(id_bitacora_estado)
);

alter table sat_aduanas_gestion_electronica.ad_gestion_electronica_bitacora_estados add constraint fk_id_solicitud_cce
foreign key(id_solicitud_g) references sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_general(id_solicitud_g);

alter table sat_aduanas_gestion_electronica.ad_gestion_electronica_bitacora_estados add constraint fk_id_estado_cce
foreign key(id_estado) references sat_aduanas_gestion_electronica.ad_gestion_electronica_catalogos(id_catalogo);


--------------------------------------------------------

--Host
--ec2-54-157-79-121.compute-1.amazonaws.com
--Database
--d2ave1aegnp7r0
--User
--cvwsmlfkqbbbqo
--Port
--5432
--Password
--da3c736be46e1779b07f39a999e6ec5604218f3ac98be1ebff343f07305e9202
--URI
--postgres://cvwsmlfkqbbbqo:da3c736be46e1779b07f39a999e6ec5604218f3ac98be1ebff343f07305e9202@ec2-54-157-79-121.compute-1.amazonaws.com:5432/d2ave1aegnp7r0
--Heroku CLI
--heroku pg:psql postgresql-tapered-82083 --app pruebasat


--Esquema de prueba en local
--CREATE  SCHEMA sat_aduanas_gestion_electronica ; 

------------------FUNCIONES----------------------------------------------------

CREATE OR REPLACE FUNCTION sat_aduanas_gestion_electronica.generar_secuencia()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
V_SECUENCIA	INTEGER:=	0;
V_ANIO		INTEGER:=   0;
BEGIN	
	SELECT 	EXTRACT(YEAR FROM current_date)
	INTO	V_ANIO;

	SELECT 	COALESCE(MAX(correlativo), 0)
	INTO	V_SECUENCIA
	FROM 	sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_general
	WHERE 	codigo_aduana = NEW.codigo_aduana
	AND		(SELECT EXTRACT(YEAR FROM fecha_creacion)) = V_ANIO;


	NEW.correlativo := V_SECUENCIA + 1;
	RETURN NEW;
	
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			V_SECUENCIA:= 0;
		
		NEW.correlativo := V_SECUENCIA + 1;
		RETURN NEW;	
END;
$function$;

------TGR

CREATE OR REPLACE TRIGGER obtener_correlativo BEFORE INSERT
ON sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_general
 FOR EACH ROW EXECUTE PROCEDURE 
generar_secuencia();


---------------------------------------------------------------

--select * from sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_general agesg
--select * from sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_manifiesto_generado agesmg

--select * from sat_aduanas_gestion_electronica.ad_gestion_electronica_detalle_razon_peticion agedrp 



--create or replace function sat_aduanas_gestion_electronica.obtener_correlativo() returns varchar as $$
--declare 
--correlativo_solicitud varchar;
--begin 


--	return correlativo_solicitud;
--end;
--$$ LANGUAGE plpgsql;




--select ('M'|| '-' ||   sg.id_aduana ||'-' || SUBSTRING(cast( EXTRACT(YEAR FROM fecha_creacion) as varchar ), 3, 4) 
--		||'-' || sg.id_solicitud) as id_solicitud, nit_usuario_creacion, fecha_creacion, es_perecedero
--from sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_general sg;

