

--Tabla que generaliza las solicitudes de carta de correcion y manifiesto generado
--contiene atributos comunes entre los dos tipos de solicitud
 
CREATE  SCHEMA sat_aduanas_gestion_electronica ; 


create table if not exists sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_general
(
	id_solicitud varchar(11)not null unique, --M EA 23 000111
	process_id varchar(16),
	nit_usuario_creacion varchar(15)not null, --nit usuario que crea la solicitud
	fecha_creacion timestamp default current_timestamp,
	nit_usuario_revision varchar(15), --nit usuario revisa y aprueba o rechaza
	fecha_revision timestamp ,
	id_aduana int not null,
	es_perecedero boolean not null, --0 no es perecedero, 1 es perecedero
	--observaciones varchar(),
	id_documento varchar(128),--ubicacion de la carpeta del archivo
	constraint pk_solicitudes_general
	primary key(id_solicitud)
);

--ALTER TABLE sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_general  
--ADD COLUMN perecedero boolean;


--ALTER TABLE sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_general 
--DROP COLUMN es_perecedero;

--ALTER TABLE sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_general
--RENAME COLUMN perecedero TO es_perecedero;

--ALTER TABLE sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_general
--RENAME COLUMN idDocumento TO id_documento;

--tabla de solicitudes de manifiesto generado

create table if not exists sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_manifiesto_generado
(
	id_solicitud_mg varchar(11) unique,
	id_solicitud varchar(11)not null,
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
add constraint fk_id_solicitud foreign key(id_solicitud)
references sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_general(id_solicitud);

--tabla donde se insertan los registros de 'otra razon de peticion'
--si el usuario selecciona la opcion de 'otros'
create table if not exists sat_aduanas_gestion_electronica.ad_gestion_electronica_detalle_razon_peticion
(
	id_detalle_razon int generated 
	always as identity(start with 1 increment by 1),
	id_solicitud varchar(11)not null,
	razon_peticion varchar(1000)not null,
	constraint pk_detalle_razon_peticion
	primary key(id_detalle_razon)
);

alter table sat_aduanas_gestion_electronica.ad_gestion_electronica_detalle_razon_peticion
add constraint fk_id_solicitud_mg foreign key(id_solicitud)
references sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_manifiesto_generado(id_solicitud_mg);

--tabla que contendra los catalogos transversales de ambas solicitudes,
--asi como los transversales de toda la miad

create table if not exists sat_aduanas_gestion_electronica.ad_gestion_electronica_catalogos
(
	id_catalogo int generated always 
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


create table if not exists sat_aduanas_gestion_electronica.ad_gestion_electronica_bitacora_estados
(
	id_bitacora_estado int generated always as identity(start with 1 increment by 1),
	id_solicitud varchar(11) not null,
	id_estado int not null, --de la tabla de catalogo
	nit_usuario_creo varchar(15) not null,
	fecha_creacion timestamp default current_timestamp,
	fecha_modificacion timestamp default current_timestamp,
	nit_usuario_modifico varchar(150) not null,
	constraint pk_bitacora_estados primary key(id_bitacora_estado)
);

alter table sat_aduanas_gestion_electronica.ad_gestion_electronica_bitacora_estados add constraint fk_id_solicitud_cce
foreign key(id_solicitud) references sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_general(id_solicitud);

alter table sat_aduanas_gestion_electronica.ad_gestion_electronica_bitacora_estados add constraint fk_id_estado_cce
foreign key(id_estado) references sat_aduanas_gestion_electronica.ad_gestion_electronica_catalogos(id_catalogo);


#------------------CCE

create table if not exists sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_cce
(
	 id_solicitud varchar(11)not null,
	 id_solicitud_cce varchar(11) not null,
	 no_Manifiesto varchar(60)  not null,
	 justificacion varchar(1000) not null,
	 constraint pk_solicitud_cce primary key(id_solicitud)
); 

alter table sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_cce
add constraint fk_id_solicitud_cce foreign key(id_solicitud)
references sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_general(id_solicitud);

 alter table sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_cce
 add constraint UC_id_solicitud unique(id_solicitud);
 
 alter table sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_cce 
 add constraint UC_correlativo unique(id_solicitud_cce);
 
 
 create table sat_aduanas_gestion_electronica.ad_gestion_electronica_detalle_solicitud
(
 id_detalle_solicitud serial not null unique ,
 id_solicitud_cce varchar(50) not null,
 nombre_campo varchar(150)  not null,
 valor_anterior varchar(150) not null ,
 valolr_actual varchar(150) not null,
 constraint pk_detalle_solicitud_cce
 primary key(id_detalle_solicitud)
);   
  
alter table sat_aduanas_gestion_electronica.ad_gestion_electronica_detalle_solicitud
add constraint fk_id_solicitud_cce foreign key(id_solicitud_cce)
references sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_cce(id_solicitud_cce);



#------------------------------------------------

select  s.id_solicitud as id,
		(ts.tipo_solicitud ||'-'|| s.codigo_aduana ||'-'||
		cast(s.anio as varchar) ||'-'|| cast(s.secuencia as varchar)) as noSolicitud,
		
			ts.actividad_operacion as actividadOperacion,
			s.nit_solicitante as nitSolicitante,
		s.nit_representado as nitRepresentado
	from 	sat_aduanas_aop.ad_aop_solicitud s
	inner join sat_aduanas_aop.ad_aop_tipo_solicitud ts
	on s.id_tipo_solicitud = ts.id_tipo_solicitud
where s.estado = ?1 order by s.id_solicitud asc
	
	


CREATE OR REPLACE FUNCTION sat_aduanas_aop.secuencia_solicitud()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
V_SEC_TEMP INTEGER := 0;
V_SEC_ORIG INTEGER := 0;

V_SECUENCIA	INTEGER:=	0;
V_ANIO		INTEGER:=   0;
BEGIN
	
	SELECT 	EXTRACT(YEAR FROM current_date)
	INTO	V_ANIO;	
	
	SELECT 	COALESCE(MAX(SECUENCIA), 0)
	INTO	V_SEC_TEMP
	FROM 	SAT_ADUANAS_AOP.AD_AOP_HISTORICO_SOLICITUD
	WHERE 	CODIGO_ADUANA = NEW.CODIGO_ADUANA
	AND		ANIO = V_ANIO;
	
	SELECT 	COALESCE(MAX(SECUENCIA), 0)
	INTO	V_SEC_ORIG
	FROM 	SAT_ADUANAS_AOP.AD_AOP_SOLICITUD
	WHERE 	CODIGO_ADUANA = NEW.CODIGO_ADUANA
	AND		ANIO = V_ANIO;
	
	IF ( V_SEC_TEMP > V_SEC_ORIG) THEN
	 V_SECUENCIA:= V_SEC_TEMP;	
	ELSIF( V_SEC_ORIG > V_SEC_TEMP ) THEN	
		V_SECUENCIA:= V_SEC_ORIG;
	END IF;

	NEW.SECUENCIA := V_SECUENCIA + 1;
	NEW.ANIO = V_ANIO;
	RETURN NEW;
	
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			V_SECUENCIA:= 0;
		
		NEW.SECUENCIA := V_SECUENCIA + 1;
		NEW.ANIO = V_ANIO;
		RETURN NEW;	
	
END;
$function$
;