package gt.sat.aduanas.gec.services.impl;

import gt.sat.aduanas.gec.models.AdCatalogos;
import gt.sat.aduanas.gec.repositories.AdCatalogosRepository;
import gt.sat.aduanas.gec.services.AdCatalogosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdCatalogosServiceImpl implements AdCatalogosService {
    @Autowired
    private AdCatalogosRepository catalogosRepository;

    @Override
    public List<AdCatalogos> listarTipoMercancia() {
        return catalogosRepository.listarTipoMercancia();
    }

    @Override
    public List<AdCatalogos> listarRazonPeticion() {
        return catalogosRepository.listarRazonPeticion();
    }
}
