package gt.sat.aduanas.gec.dtos;

import gt.sat.aduanas.gec.models.AdSolicitudMG;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@NoArgsConstructor
public class AdDetalleRazonPeticionMGDTO {
    
    private String idSolicitudMG;

    private String razon_peticion;
}
