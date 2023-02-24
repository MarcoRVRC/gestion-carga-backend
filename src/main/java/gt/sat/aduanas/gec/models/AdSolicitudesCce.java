package gt.sat.aduanas.gec.models;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "Solicitudes_cce", schema = "sat_aduanas_gestion_electronica") //, schema = "SAT_ADUANAS"
@Getter
@Setter
@NoArgsConstructor
public class AdSolicitudesCce implements Serializable {

    @Id
    @Column(name="id_solicitud")
    private String id_solicitud;

    private String id_solicitud_cce;

    private String No_Manifiesto;

    private Date justificacion;

}
