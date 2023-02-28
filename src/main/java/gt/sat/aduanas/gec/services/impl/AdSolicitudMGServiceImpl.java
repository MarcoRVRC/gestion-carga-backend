package gt.sat.aduanas.gec.services.impl;

import gt.sat.aduanas.gec.models.AdSolicitudMG;
import gt.sat.aduanas.gec.repositories.AdSolicitudMGRepository;
import gt.sat.aduanas.gec.services.AdSolicitudMGService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AdSolicitudMGServiceImpl implements AdSolicitudMGService {

    @Autowired
    private AdSolicitudMGRepository adSolicitudMGRepository;

    @Override
    public AdSolicitudMG guardar(AdSolicitudMG adSolicitudMG) {
        return adSolicitudMGRepository.save(adSolicitudMG);
    }



}
