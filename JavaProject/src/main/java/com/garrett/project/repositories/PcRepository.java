package com.garrett.project.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.garrett.project.models.PC;

public interface PcRepository extends CrudRepository<PC, Long> {
	
	
	List<PC> findAll();

	/* Form Queries */
	@Query(
	value = "SELECT * FROM computers WHERE price BETWEEN 500 AND 1000",
	nativeQuery = true)
	List<PC> findAllSmall();
	
	@Query(
	value = "SELECT * FROM computers WHERE price BETWEEN 1000 AND 1500",
	nativeQuery = true)
	List<PC> findAllMid();
	
	@Query(
	value = "SELECT * FROM computers WHERE price BETWEEN 1500 AND 20000",
	nativeQuery = true)
	List<PC> findAllMax();
	
	@Query(
	value = "SELECT * FROM computers WHERE need = 'Gaming'",
	nativeQuery = true)
	List<PC> findAllGaming();
	
	@Query(
	value = "SELECT * FROM computers WHERE need = 'Video/3D Rendering'",
	nativeQuery = true)
	List<PC> findAllVideo();
	
	@Query(
	value = "SELECT * FROM computers WHERE need = 'Professional Office'",
	nativeQuery = true)
	List<PC> findAllOffice();
	
	@Query(
	value = "SELECT * FROM computers WHERE need = 'All in one'",
	nativeQuery = true)
	List<PC> findAllIO();

}
