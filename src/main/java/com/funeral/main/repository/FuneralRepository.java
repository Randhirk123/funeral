package com.funeral.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.funeral.main.model.Funeral;

@Repository
public interface FuneralRepository extends JpaRepository<Funeral, Integer> {

}
