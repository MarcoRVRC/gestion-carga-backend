
--Ticket#10000088768
--SERVIDOR DBDESA CLOUD
--BASE DE DATOS: SAT_RTU
--ESQUEMA: NINGUNO
--OBSERVACIONES: NINGUNO 
--CREACION DE ESQUEMA
CREATE /*Ticket#10000088768*/ SCHEMA sat_aduanas_miad_gen AUTHORIZATION master;

----CREACION DE USUARIOS Y ROL PARA APLICACION 
----------------------------------------------------------------------------------------------------------------------------------------------
--Ticket#10000088768
--SERVIDOR DBDESA CLOUD
--BASE DE DATOS: SAT_RTU
--ESQUEMA: sat_aduanas_miad_gen
--OBSERVACIONES: NINGUNO 
CREATE /*Ticket#10000088768*/ user ap_sat_aduanas_miad_gen password <desa123$>;
CREATE /*Ticket#10000088768*/ role rol_ap_sat_aduanas_miad_gen;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*********************************************************************************
TICKET:      10000088768
TIPO:        DCL
DB:          SAT_RTU
GESTOR:      POSTGRESS
*********************************************************************************/
--EJECUTAR COMO DBA-

----PRIVILEGIOS DE USUARIO Y ROL PARA APLICACION
GRANT /*Ticket#10000088768*/ SELECT, INSERT, UPDATE, DELETE ON all tables IN schema sat_aduanas_miad_gen to  rol_ap_sat_aduanas_miad_gen;
GRANT /*Ticket#10000088768*/ SELECT, UPDATE ON all sequences IN schema sat_aduanas_miad_gen to rol_ap_sat_aduanas_miad_gen;
GRANT /*Ticket#10000088768*/ rol_ap_sat_aduanas_miad_gen to ap_sat_aduanas_miad_gen;
GRANT /*Ticket#10000088768*/ USAGE ON SCHEMA sat_aduanas_miad_gen TO rol_ap_sat_aduanas_miad_gen;