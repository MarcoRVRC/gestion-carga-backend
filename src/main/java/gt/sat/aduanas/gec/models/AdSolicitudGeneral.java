package gt.sat.aduanas.gec.models;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "ad_gestion_electronica_solicitudes_general", schema = "sat_aduanas_gestion_electronica") //, schema = "SAT_ADUANAS"
@Getter @Setter @NoArgsConstructor
public class AdSolicitudGeneral implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_solicitud", unique=true)
    private Integer id_solicitud;

    @Column(name = "correlativo", insertable = false)
    private Integer correlativo;

    @Column(name="process_id")
    private String idProcess;

    @Column(name="nit_usuario_creacion", nullable = false, updatable = false)
    private String nitUsuarioCreacion;

    @Column(name="fecha_creacion", insertable = false, updatable = false,
            columnDefinition ="TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaCreacion;

    @Column(name="nit_usuario_revision")
    private String nitUsuarioRevision;

    @Column(name="fecha_revision")
    private Date fechaRevision;

    @Column(name="es_perecedero", nullable=false)
    private boolean esPerecedero;

    @Column(name="id_aduana", nullable=false)
    private int idAduana;

    @Column(name="id_documento")
    private String id_documento;

}
