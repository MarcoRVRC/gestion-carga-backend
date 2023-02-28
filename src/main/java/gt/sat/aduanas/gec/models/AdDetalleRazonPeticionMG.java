package gt.sat.aduanas.gec.models;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "ad_gestion_electronica_detalle_razon_peticion", schema = "sat_aduanas_gestion_electronica")
@Getter
@Setter
@NoArgsConstructor
public class AdDetalleRazonPeticionMG {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_detalle_razon")
    private Integer id_detalle_razon_peticion;

    @OneToOne(cascade = {CascadeType.ALL})
    @JoinColumn(name = "id_solicitud")
    private AdSolicitudGeneral id_solicitud;

    private String razon_peticion;
}
