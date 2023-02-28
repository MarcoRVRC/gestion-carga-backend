package gt.sat.aduanas.gec.controllers;

import gt.sat.aduanas.gec.models.AdSolicitudGeneral;
import gt.sat.aduanas.gec.models.AdSolicitudesCce;
import gt.sat.aduanas.gec.services.AdSolicitudCceService;
import gt.sat.aduanas.gec.services.AdSolicitudGeneralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/adSolicitudesCce")
@CrossOrigin(origins = "*")
public class AdSolicitudesCceController {
    @Autowired
    private AdSolicitudCceService adSolicitudCceService;

    @Autowired
    private AdSolicitudGeneralService adSolicitudGeneralService;

    @PostMapping("/guardar")
    public ResponseEntity<AdSolicitudesCce> guardar(@RequestBody AdSolicitudesCce adSolicitudesCce) {
       return ResponseEntity.ok( adSolicitudCceService.guardar(adSolicitudesCce));
    }

    @GetMapping("/buscarPorId/{idSolicitud}")
    public ResponseEntity<AdSolicitudGeneral> buscarPorId(@PathVariable("idSolicitud") Integer idSolicitud) {
        return ResponseEntity.ok(adSolicitudGeneralService.buscarPorId(idSolicitud));
    }

}
