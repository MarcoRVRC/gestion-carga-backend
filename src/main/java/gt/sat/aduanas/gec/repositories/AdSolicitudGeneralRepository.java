package gt.sat.aduanas.gec.repositories;

import gt.sat.aduanas.gec.models.AdSolicitudGeneral;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdSolicitudGeneralRepository extends CrudRepository<AdSolicitudGeneral, String> {

}
