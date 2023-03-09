package gt.sat.aduanas.gec.models;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "aduanas_miad_general", schema = "ad_catalogos")
@Getter
@Setter
@NoArgsConstructor
public class AdCatalogos implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_catalogo;

    private Integer codigo_catalogo;

    private String nombre_catalogo;

    private String descripcion_catalogo;

    private boolean estado;

}
