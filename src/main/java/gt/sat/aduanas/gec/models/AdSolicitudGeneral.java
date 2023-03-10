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
    //@Column(name = "id_solicitud_g")
    private Integer id_solicitud_g;

    @Column(name = "correlativo")
    private Integer correlativo;

    @Column(name="process_id")
    private String idProcess;

    @Column(name="tipo_solicitud")
    private Integer tipo_solicitud;


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

    @Column(name="es_perecedero", nullable=false, columnDefinition = "boolean not null default false")
    private boolean esPerecedero;

    @Column(name="codigo_aduana", nullable=false)
    private String codigo_aduana;

    @Column(name="id_documento")
    private String id_documento;

    @Column(name="id_estado", insertable = false, columnDefinition = "int default 1")
    private int id_estado;
}
