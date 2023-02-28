package gt.sat.aduanas.gec.repositories;

import gt.sat.aduanas.gec.models.AdDetalleRazonPeticionMG;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdDetalleRazonPeticionMGRepository extends CrudRepository<AdDetalleRazonPeticionMG, Integer> {
}
