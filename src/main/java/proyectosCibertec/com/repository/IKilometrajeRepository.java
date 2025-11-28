package proyectosCibertec.com.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import proyectosCibertec.com.model.Kilometraje;

public interface IKilometrajeRepository extends JpaRepository<Kilometraje, Integer> {
    List<Kilometraje> findByEstado(int estado);
}
