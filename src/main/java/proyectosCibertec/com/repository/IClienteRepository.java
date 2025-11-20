package proyectosCibertec.com.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import proyectosCibertec.com.model.Clientes;

public interface IClienteRepository extends JpaRepository<Clientes, Integer> {
	Page<Clientes> findByEstado(Integer estado, PageRequest pageRequest);
}
