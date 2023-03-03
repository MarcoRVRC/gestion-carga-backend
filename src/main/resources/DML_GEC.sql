select correlativo, to_char(correlativo, '000000')
from sat_aduanas_gestion_electronica.ad_gestion_electronica_solicitudes_general--(1,10) as x(n)
--order by x.n;
---------TIPO CATALOGO-------------------------------------------------------------

INSERT INTO sat_aduanas_gestion_electronica.ad_gec_tipo_catalogo (nombre,login_creo,login_modifico)
	VALUES ('TIPO_SOLICITUD','aejuarez','NA');
	
INSERT INTO sat_aduanas_gestion_electronica.ad_gec_tipo_catalogo (nombre,login_creo,login_modifico)
	VALUES ('ESTADOS','aejuarez','NA');

---------CATALOGO TIPOS_SOLICITUD-------------------------------------------------------------

INSERT INTO sat_aduanas_gestion_electronica.ad_gestion_electronica_catalogos (nombre_catalogo,descripcion_catalogo,login_creacion,login_modificacion,codigo_catalogo)
	VALUES ('CC','Abreviatura de la carta de correcoin','aejuarez','NA',1);
	
INSERT INTO sat_aduanas_gestion_electronica.ad_gestion_electronica_catalogos (nombre_catalogo,descripcion_catalogo,login_creacion,login_modificacion,codigo_catalogo)
	VALUES ('M','Solicitud de manifiesto generado','mrac','NA',1);

---------CATALOGO ESTADOS-------------------------------------------------------------

INSERT INTO sat_aduanas_gestion_electronica.ad_gestion_electronica_catalogos
(codigo_catalogo, nombre_catalogo, descripcion_catalogo, fecha_creacion, fecha_modificacion, login_creacion, login_modificacion)
VALUES('ESTADO', 'PA',
'Estado se asignará a la solicitud cuando la misma se registre.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'mrac', 'NA');


INSERT INTO sat_aduanas_gestion_electronica.ad_gestion_electronica_catalogos
(codigo_catalogo, nombre_catalogo, descripcion_catalogo, fecha_creacion, fecha_modificacion, login_creacion, login_modificacion)
VALUES('ESTADO', 'APR', 'Aprobada por Revisor.  Estado se asignará cuando la aduana autorice la 
		solicitud de manifiesto generado en aduanas.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'mrac', 'NA');

INSERT INTO sat_aduanas_gestion_electronica.ad_gestion_electronica_catalogos
(codigo_catalogo, nombre_catalogo, descripcion_catalogo, fecha_creacion, fecha_modificacion, login_creacion, login_modificacion)
VALUES('ESTADO', 'RPR', 'Rechazada por revisor. Estado de rechazo se asignará cuando la aduana rechace la solicitud presentada.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'mrac', 'NA');

INSERT INTO sat_aduanas_gestion_electronica.ad_gestion_electronica_catalogos
(codigo_catalogo, nombre_catalogo, descripcion_catalogo, fecha_creacion, fecha_modificacion, login_creacion, login_modificacion)
VALUES('ESTADO', 'B', 'Solicitud borrada. Estado se asignará cuando la misma sea borrada de manera automática por el sistema.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'mrac', 'NA');

---MG

INSERT INTO sat_aduanas_gestion_electronica.ad_gestion_electronica_catalogos
(codigo_catalogo, nombre_catalogo, descripcion_catalogo, fecha_creacion, fecha_modificacion, login_creacion, login_modificacion)
VALUES('ESTADO', 'ER', 'En Revisión.Estado se asignará cuando se encuentra en revisión .', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'mrac', 'NA');


INSERT INTO sat_aduanas_gestion_electronica.ad_gestion_electronica_catalogos
(codigo_catalogo, nombre_catalogo, descripcion_catalogo, fecha_creacion, fecha_modificacion, login_creacion, login_modificacion)
VALUES('ESTADO', 'NE', 'Notificación emitida. Cuando el contribuyente se da por notificado.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'mrac', 'NA');


INSERT INTO sat_aduanas_gestion_electronica.ad_gestion_electronica_catalogos
(codigo_catalogo, nombre_catalogo, descripcion_catalogo, fecha_creacion, fecha_modificacion, login_creacion, login_modificacion)
VALUES('ESTADO', 'U', 'Solicitud Utilizada.Estado se asignará cuando la misma sea utilizada en una declaración de mercancías.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'mrac', 'NA');

