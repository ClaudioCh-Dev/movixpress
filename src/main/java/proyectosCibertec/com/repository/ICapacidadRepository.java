package proyectosCibertec.com.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import proyectosCibertec.com.model.Capacidad;

public interface ICapacidadRepository extends JpaRepository<Capacidad, Integer> {
    List<Capacidad> findByEstado(int estado);
}
