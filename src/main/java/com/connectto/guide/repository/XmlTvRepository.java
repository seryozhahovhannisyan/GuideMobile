package com.connectto.guide.repository;

import com.connectto.guide.entity.XmlTv;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface XmlTvRepository extends JpaRepository<XmlTv, Long>
{

}