package gt.sat.aduanas.gec.controllers;

import gt.sat.aduanas.gec.models.AdDetalleRazonPeticionMG;
import gt.sat.aduanas.gec.models.AdSolicitudMG;
import gt.sat.aduanas.gec.services.AdDetalleRazonPeticionMGService;
import gt.sat.aduanas.gec.services.AdSolicitudMGService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/SolicitudMG")
@CrossOrigin(origins = "*")
public class AdSolicitudMGController {

    @Autowired
    private AdSolicitudMGService adSolicitudMGService;
    @Autowired
    private AdDetalleRazonPeticionMGService adDetalleRazonPeticionMGService;

    @PostMapping("/guardar")
    public ResponseEntity<AdSolicitudMG> guardar(@RequestBody AdSolicitudMG adSolicitudMG) {
        AdSolicitudMG obj = adSolicitudMGService.guardar(adSolicitudMG);
        if(obj != null) {
           //adDetalleRazonPeticionMGService.guardar(adDetalleRazonPeticionMG);
            return ResponseEntity.ok(obj);
        }
        return ResponseEntity.internalServerError().build();
    }

    @PostMapping("/guardarRazon")
    public ResponseEntity<AdDetalleRazonPeticionMG> guardarRazon(@RequestBody AdDetalleRazonPeticionMG adDetalleRazonPeticionMG) {
        AdDetalleRazonPeticionMG obj = adDetalleRazonPeticionMGService.guardar(adDetalleRazonPeticionMG);
        if(obj != null) {
            return ResponseEntity.ok(obj);
        }
        return ResponseEntity.notFound().build();
    }

}
