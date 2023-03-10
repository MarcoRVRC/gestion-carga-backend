package gt.sat.aduanas.gec.services;

import gt.sat.aduanas.gec.models.AdSolicitudMG;

import java.util.Optional;

public interface AdSolicitudMGService {

    AdSolicitudMG guardar(AdSolicitudMG adSolicitudMG);

    Optional<AdSolicitudMG> buscarPorId(Integer idSolicitud);

}
