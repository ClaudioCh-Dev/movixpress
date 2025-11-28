package proyectosCibertec.com.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import proyectosCibertec.com.model.Combustible;

public interface ICombustibleRepository extends JpaRepository<Combustible, Integer> {
    List<Combustible> findByEstado(int estado);
}
