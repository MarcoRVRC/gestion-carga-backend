package gt.sat.aduanas.gec.repositories;

import gt.sat.aduanas.gec.models.AdCatalogos;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdCatalogosRepository extends CrudRepository<AdCatalogos, Integer> {

    @Query(value = "SELECT c.id_catalogo, c.codigo_catalogo, c.nombre_catalogo, c.descripcion_catalogo, c.estado\n" +
            "FROM aduanas_miad_general.ad_catalogos c\n" +
            "inner join aduanas_miad_general.ad_tipo_catalogos t on c.codigo_catalogo = t.id_tipo_catalogo \n" +
            "where c.estado=true and t.nombre  = 'TIPO_MERCANCIA' order by c.id_catalogo asc;", nativeQuery = true)
    List<AdCatalogos> listarTipoMercancia();


    @Query(value = "SELECT c.id_catalogo, c.codigo_catalogo, c.nombre_catalogo, c.descripcion_catalogo, c.estado\n" +
            "FROM aduanas_miad_general.ad_catalogos c\n" +
            "inner join aduanas_miad_general.ad_tipo_catalogos t on c.codigo_catalogo = t.id_tipo_catalogo \n" +
            "where c.estado=true and t.nombre  = 'RAZON_PETICION' order by c.id_catalogo asc;", nativeQuery = true)
    List<AdCatalogos> listarRazonPeticion();

}
