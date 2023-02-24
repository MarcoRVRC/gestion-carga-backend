package gt.sat.aduanas.gec.services;

import gt.sat.aduanas.gec.models.AdSolicitudGeneral;
import gt.sat.aduanas.gec.repositories.AdSolicitudGeneralRepository;

public interface AdSolicitudGeneralService  {

    AdSolicitudGeneral guardar  (AdSolicitudGeneral adSolicitudGeneral);

    AdSolicitudGeneral buscarPorId (String idSolicitud);

}
