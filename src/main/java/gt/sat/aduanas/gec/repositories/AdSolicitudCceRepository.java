package gt.sat.aduanas.gec.repositories;

import gt.sat.aduanas.gec.models.AdSolicitudesCce;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdSolicitudCceRepository extends CrudRepository<AdSolicitudesCce, String> {
}
