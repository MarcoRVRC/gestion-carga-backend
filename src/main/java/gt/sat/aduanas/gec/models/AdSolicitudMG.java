package gt.sat.aduanas.gec.models;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "ad_gestion_electronica_solicitudes_manifiesto_generado", schema = "sat_aduanas_gestion_electronica") //, schema = ""
@Getter
@Setter
@NoArgsConstructor
public class AdSolicitudMG implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_solicitud_mg;

    @OneToOne(cascade = {CascadeType.ALL})
    @JoinColumn(name = "id_solicitud_g")
    private AdSolicitudGeneral id_solicitud_g;

    private int id_tipo_mercancias;

    private int id_motivo_peticion;

    private String no_manifiesto;

    private String no_documento_transporte;

    private String no_contenedor;

    private String no_orden_declaracion;

    private String no_vin;
}
