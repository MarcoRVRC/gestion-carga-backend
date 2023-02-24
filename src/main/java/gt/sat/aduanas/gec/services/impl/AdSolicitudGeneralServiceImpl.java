package gt.sat.aduanas.gec.services.impl;

import gt.sat.aduanas.gec.models.AdSolicitudGeneral;
import gt.sat.aduanas.gec.repositories.AdSolicitudGeneralRepository;
import gt.sat.aduanas.gec.services.AdSolicitudGeneralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdSolicitudGeneralServiceImpl implements AdSolicitudGeneralService {
    @Autowired
    private AdSolicitudGeneralRepository adSolicitudGeneralRepository;

    @Override
    public AdSolicitudGeneral guardar(AdSolicitudGeneral adSolicitudGeneral) {
        return adSolicitudGeneralRepository.save(adSolicitudGeneral);
    }

    @Override
    public AdSolicitudGeneral buscarPorId(String idSolicitud) {
        return adSolicitudGeneralRepository.findById(idSolicitud).orElse(null);
    }
}

