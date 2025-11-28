package proyectosCibertec.com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import proyectosCibertec.com.model.Combustible;
import proyectosCibertec.com.repository.ICombustibleRepository;

@Controller
@RequestMapping("/combustibles")
public class CombustibleController {

    @Autowired
    private ICombustibleRepository repoCombustible;

    @GetMapping("/listado")
    public String listado(Model model) {
        List<Combustible> lista = repoCombustible.findByEstado(1);
        model.addAttribute("lstCombustibles", lista);
        model.addAttribute("combustible", new Combustible());
        model.addAttribute("vista", "activas");
        return "private-pages/combustibles";
    }

    @PostMapping("/registro")
    public String registrar(@ModelAttribute Combustible c, RedirectAttributes ra) {
        try {
            repoCombustible.save(c);
            ra.addFlashAttribute("mensaje", "Combustible registrado correctamente");
            ra.addFlashAttribute("css_mensaje", "alert alert-success");
            ra.addFlashAttribute("tipoMensaje", "success");
        } catch (Exception e) {
            ra.addFlashAttribute("mensaje", "Error al registrar combustible: " + e.getMessage());
            ra.addFlashAttribute("css_mensaje", "alert alert-danger");
            ra.addFlashAttribute("tipoMensaje", "error");
        }
        return "redirect:/combustibles/listado";
    }

    @PostMapping("/editar")
    public String editar(@ModelAttribute Combustible c, RedirectAttributes ra) {
        try {
            repoCombustible.save(c);
            ra.addFlashAttribute("mensaje", "Combustible actualizado correctamente");
            ra.addFlashAttribute("css_mensaje", "alert alert-success");
            ra.addFlashAttribute("tipoMensaje", "success");
        } catch (Exception e) {
            ra.addFlashAttribute("mensaje", "Error al actualizar combustible: " + e.getMessage());
            ra.addFlashAttribute("css_mensaje", "alert alert-danger");
            ra.addFlashAttribute("tipoMensaje", "error");
        }
        return "redirect:/combustibles/listado";
    }

    @PostMapping("/eliminar/{id}")
    public String eliminar(@PathVariable int id, RedirectAttributes ra) {
        try {
            Combustible c = repoCombustible.findById(id).orElseThrow();
            c.setEstado(2);
            repoCombustible.save(c);

            ra.addFlashAttribute("mensaje", "Combustible eliminado");
            ra.addFlashAttribute("css_mensaje", "alert alert-success");
            ra.addFlashAttribute("tipoMensaje", "success");
        } catch (Exception e) {
            ra.addFlashAttribute("mensaje", "Error al eliminar: " + e.getMessage());
            ra.addFlashAttribute("css_mensaje", "alert alert-danger");
            ra.addFlashAttribute("tipoMensaje", "error");
        }
        return "redirect:/combustibles/listado";
    }

    @GetMapping("/cancelados")
    public String cancelados(Model model) {
        List<Combustible> lista = repoCombustible.findByEstado(2);
        model.addAttribute("lstCombustibles", lista);
        model.addAttribute("combustible", new Combustible());
        model.addAttribute("vista", "canceladas");
        return "private-pages/combustibles";
    }

    @GetMapping("/restaurar/{id}")
    public String restaurar(@PathVariable int id, RedirectAttributes ra) {
        try {
            Combustible c = repoCombustible.findById(id).orElseThrow();
            c.setEstado(1);
            repoCombustible.save(c);

            ra.addFlashAttribute("mensaje", "Combustible restaurado correctamente");
            ra.addFlashAttribute("css_mensaje", "alert alert-success");
            ra.addFlashAttribute("tipoMensaje", "success");

        } catch (Exception e) {
            ra.addFlashAttribute("mensaje", "Error al restaurar: " + e.getMessage());
            ra.addFlashAttribute("css_mensaje", "alert alert-danger");
            ra.addFlashAttribute("tipoMensaje", "error");
        }
        return "redirect:/combustibles/cancelados";
    }
}