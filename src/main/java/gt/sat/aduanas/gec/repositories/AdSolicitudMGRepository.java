package gt.sat.aduanas.gec.repositories;

import gt.sat.aduanas.gec.models.AdSolicitudMG;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdSolicitudMGRepository extends CrudRepository<AdSolicitudMG, Integer> {
}
