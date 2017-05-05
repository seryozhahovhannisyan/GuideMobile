package com.connectto.guide.repository;

import com.connectto.guide.entity.XmlFilesUpdate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface XmlFilesUpdateRepository extends JpaRepository<XmlFilesUpdate, Long> {
}