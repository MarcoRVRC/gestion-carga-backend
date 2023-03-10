select correlativo, to_char(correlativo, '000000')
from sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_general--(1,10) as x(n)
--order by x.n;
---------TIPO CATALOGO-------------------------------------------------------------

---------TIPO CATALOGO TIPOS SOLICITUDES-------------------------------------------------------------
INSERT INTO aduanas_miad_general.ad_tipo_catalogos (nombre,login_creo,login_modifico)
	VALUES ('TIPO_SOLICITUD','aejuarez','NA');

---------TIPO CATALOGO ESTADOS-------------------------------------------------------------

INSERT INTO aduanas_miad_general.ad_tipo_catalogos (nombre,login_creo,login_modifico)
	VALUES ('ESTADOS','aejuarez','NA');
	
---------TIPO CATALOGO ADUANAS-------------------------------------------------------------

INSERT INTO aduanas_miad_general.ad_tipo_catalogos
(nombre, login_creo, fecha_creacion, fecha_modificacion, login_modifico)
VALUES('TIPO_ADUANA', 'mvraccot', NULL, NULL, 'NA');

---------TIPO CATALOGO RAZON PETICION-------------------------------------------------------------

INSERT INTO aduanas_miad_general.ad_tipo_catalogos
( nombre, login_creo, fecha_creacion, fecha_modificacion, login_modifico)
VALUES('RAZON_PETICION', 'mvraccot', NULL, NULL, 'NA');

---------TIPO CATALOGO TIPO DE MERCANCIA-------------------------------------------------------------

INSERT INTO aduanas_miad_general.ad_tipo_catalogos
( nombre, login_creo, login_modifico)
VALUES('TIPO_MERCANCIA', 'mvraccot', 'NA');


#----CATALOGOS-----------------------------------------------------------------------------
---------CATALOGO TIPOS_SOLICITUD-------------------------------------------------------------

INSERT INTO  aduanas_miad_general.ad_catalogos (nombre_catalogo,descripcion_catalogo,login_creacion,login_modificacion,codigo_catalogo)
	VALUES ('CC','Abreviatura de la carta de correcoin','aejuarez','NA',1);
	
INSERT INTO  aduanas_miad_general.ad_catalogos (nombre_catalogo,descripcion_catalogo,login_creacion,login_modificacion,codigo_catalogo)
	VALUES ('M','Solicitud de manifiesto generado','mrac','NA',1);

---------CATALOGO ESTADOS-------------------------------------------------------------
INSERT INTO aduanas_miad_general.ad_catalogos (codigo_catalogo,nombre_catalogo,descripcion_catalogo,login_creacion,login_modificacion)
	VALUES (2,'PA','Estado se asignar?? a la solicitud cuando la misma se registre.','aejuarez','NA');
	
	
INSERT INTO aduanas_miad_general.ad_catalogos (codigo_catalogo,nombre_catalogo,descripcion_catalogo,login_creacion,login_modificacion)
	VALUES (2,'APR','Aprobada por Revisor.  Estado se asignar?? cuando la aduana autorice la 
		solicitud de manifiesto generado en aduanas.','aejuarez','NA');
	
INSERT INTO aduanas_miad_general.ad_catalogos (codigo_catalogo,nombre_catalogo,descripcion_catalogo,login_creacion,login_modificacion)
	VALUES (2,'RPR','Rechazada por revisor. Estado de rechazo se asignar?? cuando la aduana rechace la solicitud presentada.','aejuarez','NA');

INSERT INTO aduanas_miad_general.ad_catalogos (codigo_catalogo,nombre_catalogo,descripcion_catalogo,login_creacion,login_modificacion)
	VALUES (2,'B','Solicitud borrada. Estado se asignar?? cuando la misma sea borrada de manera autom??tica por el sistema.','aejuarez','NA');


---MG

INSERT INTO aduanas_miad_general.ad_catalogos (codigo_catalogo,nombre_catalogo,descripcion_catalogo,login_creacion,login_modificacion)
VALUES (2,'ER','En Revisi??n.Estado se asignar?? cuando se encuentra en revisi??n.','mvraccot','NA');

INSERT INTO aduanas_miad_general.ad_catalogos (codigo_catalogo,nombre_catalogo,descripcion_catalogo,login_creacion,login_modificacion)
VALUES (2,'NE','Notificaci??n emitida. Cuando el contribuyente se da por notificado.','mvraccot','NA');

INSERT INTO aduanas_miad_general.ad_catalogos (codigo_catalogo,nombre_catalogo,descripcion_catalogo,login_creacion,login_modificacion)
VALUES (2,'U','Solicitud Utilizada.Estado se asignar?? cuando la misma sea utilizada en una declaraci??n de mercanc??as.','mvraccot','NA');


-------------------CATALOGO TIPO MERCANCIAS--------------------------------------------------

INSERT INTO aduanas_miad_general.ad_catalogos
(nombre_catalogo, descripcion_catalogo, fecha_creacion, fecha_modificacion, login_creacion, login_modificacion, codigo_catalogo)
VALUES('Documentos', 'NA', NULL, NULL, 'mvraccot', 'NA', 5);

INSERT INTO  aduanas_miad_general.ad_catalogos
(nombre_catalogo, descripcion_catalogo, login_creacion, login_modificacion, codigo_catalogo)
VALUES('Envios de bajo valor no sujetos al pago de impuestos', 'NA', 'mvraccot', 'NA', 5);

INSERT INTO  aduanas_miad_general.ad_catalogos
(nombre_catalogo, descripcion_catalogo, login_creacion, login_modificacion, codigo_catalogo)
VALUES('Envios de bajo valor sujetos al pago de impuestos', 'NA', 'mvraccot', 'NA', 5);

INSERT INTO  aduanas_miad_general.ad_catalogos
(nombre_catalogo, descripcion_catalogo, login_creacion, login_modificacion, codigo_catalogo)
VALUES('Vehiculos', 'NA', 'mvraccot', 'NA', 5);

INSERT INTO  aduanas_miad_general.ad_catalogos
(nombre_catalogo, descripcion_catalogo, login_creacion, login_modificacion, codigo_catalogo)
VALUES('Carga paletizada', 'NA', 'mvraccot', 'NA', 5);

INSERT INTO  aduanas_miad_general.ad_catalogos
(nombre_catalogo, descripcion_catalogo, login_creacion, login_modificacion, codigo_catalogo)
VALUES('Carga contenerizada', 'NA', 'mvraccot', 'NA', 5);

INSERT INTO  aduanas_miad_general.ad_catalogos
(nombre_catalogo, descripcion_catalogo, login_creacion, login_modificacion, codigo_catalogo)
VALUES('Carga suelta(break bulk-carga no contenerizada y no paletizada)', 'NA', 'mvraccot', 'NA', 5);

INSERT INTO  aduanas_miad_general.ad_catalogos
(nombre_catalogo, descripcion_catalogo, login_creacion, login_modificacion, codigo_catalogo)
VALUES('Carga general(contenerizada y otros empaques mixtos)', 'NA', 'mvraccot', 'NA', 5);

INSERT INTO  aduanas_miad_general.ad_catalogos
(nombre_catalogo, descripcion_catalogo, login_creacion, login_modificacion, codigo_catalogo)
VALUES('Carga liquida', 'NA', 'mvraccot', 'NA', 5);

-------------------CATALOGO RAZON DE PETICION MG--------------------------------------------------

INSERT INTO aduanas_miad_general.ad_catalogos
(nombre_catalogo, descripcion_catalogo, login_creacion, login_modificacion, codigo_catalogo)
VALUES('Pago tributos de mercanc??as decomisadas cuya orden emana de juez componente.', 'NA', 'mvraccot', 'NA', 4);

INSERT INTO aduanas_miad_general.ad_catalogos
(nombre_catalogo, descripcion_catalogo, login_creacion, login_modificacion, codigo_catalogo)
VALUES('Pago de tributos de veh??culos(automotores y acu??ticos)de turistas.', 'NA', 'mvraccot', 'NA', 4);

INSERT INTO aduanas_miad_general.ad_catalogos
(nombre_catalogo, descripcion_catalogo, login_creacion, login_modificacion, codigo_catalogo)
VALUES('Pago de tributos por sofware adquirido v??a electr??nica.', 'NA', 'mvraccot', 'NA', 4);

INSERT INTO aduanas_miad_general.ad_catalogos
(nombre_catalogo, descripcion_catalogo, login_creacion, login_modificacion, codigo_catalogo)
VALUES('Pago de tributos de mercanc??as ingresadas temporalmente.', 'NA', 'mvraccot', 'NA', 4);

INSERT INTO aduanas_miad_general.ad_catalogos
(nombre_catalogo, descripcion_catalogo, login_creacion, login_modificacion, codigo_catalogo)
VALUES('Transmisi??n de declaraciones de mercanc??as perecederas.', 'NA', 'mvraccot', 'NA', 4);

INSERT INTO aduanas_miad_general.ad_catalogos
(nombre_catalogo, descripcion_catalogo, login_creacion, login_modificacion, codigo_catalogo)
VALUES('Transmisi??n de declaraciones de mercanc??as catalogadas como env??os de socorro.', 'NA', 'mvraccot', 'NA', 4);

INSERT INTO aduanas_miad_general.ad_catalogos
(nombre_catalogo, descripcion_catalogo, login_creacion, login_modificacion, codigo_catalogo)
VALUES('El documento de transporte ser?? utilizado en mas de una declaraci??n con distinta clave de r??gimen para el mismo consignatario. 
Considerar lo indicado en los procedimientos de aduana que norman esta operaci??n.', 'NA', 'mvraccot', 'NA', 4);

INSERT INTO aduanas_miad_general.ad_catalogos
(nombre_catalogo, descripcion_catalogo, login_creacion, login_modificacion, codigo_catalogo)
VALUES('El documento de transporte ser?? utilizado en m??s de una declaraci??n aduanera con la misma
		clave de r??gimen para el mismo consignatario.', 'NA', 'mvraccot', 'NA', 4);

INSERT INTO aduanas_miad_general.ad_catalogos
(nombre_catalogo, descripcion_catalogo, login_creacion, login_modificacion, codigo_catalogo)
VALUES('Problemas de validaci??n en el sistema de DUA por datos del manifiesto originalmente transmitido.', 'NA', 'mvraccot', 'NA', 4);

INSERT INTO aduanas_miad_general.ad_catalogos
(nombre_catalogo, descripcion_catalogo, login_creacion, login_modificacion, codigo_catalogo)
VALUES('Pago por excedentes de mercanc??as a granel conforme a lo establecido en el 
		Reglamento del C??digo Aduanero Uniforme Centroamericano(5%).', 'NA', 'mvraccot', 'NA', 4);

INSERT INTO aduanas_miad_general.ad_catalogos
(nombre_catalogo, descripcion_catalogo, login_creacion, login_modificacion, codigo_catalogo)
VALUES('Mercanc??as adjudicadas en subasta.', 'NA', 'mvraccot', 'NA',4);

INSERT INTO aduanas_miad_general.ad_catalogos
(nombre_catalogo, descripcion_catalogo, login_creacion, login_modificacion, codigo_catalogo)
VALUES('Pago de tributos por mercanc??a distinta del equipaje.', 'NA', 'mvraccot', 'NA', 4);

INSERT INTO aduanas_miad_general.ad_catalogos
(nombre_catalogo, descripcion_catalogo, login_creacion, login_modificacion, codigo_catalogo)
VALUES('Otros', 'NA', 'mvraccot', 'NA', 4);


-- Auto-generated SQL script #202303071245
INSERT INTO aduanas_miad_general.ad_catalogos (codigo_catalogo,nombre_catalogo,descripcion_catalogo,login_creacion,login_modificacion)
	VALUES (6,'Transporte Aereo','Transporte Aereo','aejuarez','NA');
	
INSERT INTO aduanas_miad_general.ad_catalogos (codigo_catalogo,nombre_catalogo,descripcion_catalogo,login_creacion,login_modificacion)
	VALUES (6,'Transporte Terrestre','Transporte Terrestre','aejuarez','NA');
	
INSERT INTO aduanas_miad_general.ad_catalogos (codigo_catalogo,nombre_catalogo,descripcion_catalogo,login_creacion,login_modificacion)
	VALUES (6,'Transporte Maritimo','Transporte Maritimo','aejuarez','NA');
	
---------TIPOS DE TRANSPORTE---------------------------------------------------------------
	
INSERT INTO aduanas_miad_general.ad_catalogos (codigo_catalogo,nombre_catalogo,descripcion_catalogo,login_creacion,login_modificacion)
	VALUES (6,'Correo','Correo','aejuarez','NA');
	
INSERT INTO aduanas_miad_general.ad_catalogos (codigo_catalogo,nombre_catalogo,descripcion_catalogo,login_creacion,login_modificacion)
	VALUES (3,'M','Corresponde a la Aduana Maritima','aejuarez','NA');
	
INSERT INTO aduanas_miad_general.ad_catalogos (codigo_catalogo,nombre_catalogo,descripcion_catalogo,login_creacion,login_modificacion)
	VALUES (3,'T','Corresponde a la Aduana Terrestre','aejuarez','NA');
	
INSERT INTO aduanas_miad_general.ad_catalogos (codigo_catalogo,nombre_catalogo,descripcion_catalogo,login_creacion,login_modificacion)
	VALUES (3,'A','Corresponde a la Aduana Aerea','aejuarez','NA');

INSERT INTO aduanas_miad_general.ad_tipo_catalogos (nombre,login_creo,login_modifico)
	VALUES ('PAISES','aejuarez','NA');