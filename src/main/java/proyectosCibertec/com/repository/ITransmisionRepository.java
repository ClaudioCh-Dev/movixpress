package proyectosCibertec.com.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import proyectosCibertec.com.model.Transmision;

public interface ITransmisionRepository extends JpaRepository<Transmision, Integer> {
    List<Transmision> findByEstado(int estado);
}
