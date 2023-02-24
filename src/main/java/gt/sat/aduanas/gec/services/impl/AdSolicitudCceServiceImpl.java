package gt.sat.aduanas.gec.services.impl;

import gt.sat.aduanas.gec.models.AdSolicitudesCce;
import gt.sat.aduanas.gec.repositories.AdSolicitudCceRepository;
import gt.sat.aduanas.gec.services.AdSolicitudCceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdSolicitudCceServiceImpl implements AdSolicitudCceService {
    @Autowired
    private AdSolicitudCceRepository adSolicitudCceRepository;

    @Override
    public AdSolicitudesCce guardar(AdSolicitudesCce adSolicitudesCce) {
        return adSolicitudCceRepository.save(adSolicitudesCce);
    }
}



