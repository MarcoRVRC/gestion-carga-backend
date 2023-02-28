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
    @Column(name = "id_solicitud_mg")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String id_solicitud_mg;

    @Column(name = "correlativo_solicitud", insertable = false)
    private String correlativo_solicitud;

    @OneToOne(cascade = {CascadeType.ALL})
    @JoinColumn(name = "id_solicitud")
    private AdSolicitudGeneral idSolcitud;

    private int id_tipo_mercancias;

    private int id_motivo_peticion;

    private String no_manifiesto;

    private String no_documento_transporte;

    private String no_contenedor;

    private String no_orden_declaracion;

    private String no_vin;



}
