package gt.sat.aduanas.gec.controllers;

import gt.sat.aduanas.gec.models.AdSolicitudMG;
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

    @PostMapping("/guardar")
    public ResponseEntity<AdSolicitudMG> guardar(@RequestBody AdSolicitudMG adSolicitudMG) {
        AdSolicitudMG obj = adSolicitudMGService.guardar(adSolicitudMG);
        if(obj != null) {
            return ResponseEntity.ok(obj);
        }
        return ResponseEntity.internalServerError().build();
    }

    @GetMapping("/buscarPorId/{idSolicitud}")
    public ResponseEntity<Optional<AdSolicitudMG>> buscarPorId(@PathVariable("idSolicitud") String idSolicitud) {
        return ResponseEntity.ok(adSolicitudMGService.buscarPorId(idSolicitud));
    }
}
