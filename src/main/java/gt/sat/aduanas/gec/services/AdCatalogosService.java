package gt.sat.aduanas.gec.services;

import gt.sat.aduanas.gec.models.AdCatalogos;

import java.util.List;

public interface AdCatalogosService {

    List<AdCatalogos> listarTipoMercancia();

    List<AdCatalogos> listarRazonPeticion();

}
