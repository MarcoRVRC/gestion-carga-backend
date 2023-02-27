package gt.sat.aduanas.gec.services.impl;

import gt.sat.aduanas.gec.models.AdDetalleRazonPeticionMG;
import gt.sat.aduanas.gec.repositories.AdDetalleRazonPeticionMGRepository;
import gt.sat.aduanas.gec.services.AdDetalleRazonPeticionMGService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AdDetalleRazonPeticionMGServiceImpl implements AdDetalleRazonPeticionMGService {

    @Autowired
    private AdDetalleRazonPeticionMGRepository adDetalleRazonPeticionMGRepository;

    @Override
    public AdDetalleRazonPeticionMG guardar(AdDetalleRazonPeticionMG adDetalleRazonPeticionMG) {
        return adDetalleRazonPeticionMGRepository.save(adDetalleRazonPeticionMG);
    }

    @Override
    public Optional<AdDetalleRazonPeticionMG> buscarPorId(Long idDetalleRazonPeticion) {
        return adDetalleRazonPeticionMGRepository.findById(idDetalleRazonPeticion);
    }
}
